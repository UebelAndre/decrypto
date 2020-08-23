
extern crate proc_macro;

use std::{
    vec::Vec,
    ops::FnMut,
    fmt::*,
    boxed::Box,
};

type Callback = dyn FnMut() -> ();

pub struct State {
    on_enter: Option<Box<Callback>>,
    on_update: Option<Box<Callback>>,
    on_exit: Option<Box<Callback>>,
    transition_mask: u32,
}

impl State {
    fn can_transition<T: Into<u32>>(&self, new_state: T) -> bool {
        self.transition_mask & (1 << new_state.into()) != 0
    }
}

#[macro_export]
macro_rules! mask {
    ($($shift:expr),* $(,)?) => {
        $((1 << ($shift as u32)))|*
    }
}


pub trait StateEnum {
    fn count() -> usize;
}

#[derive(Debug, PartialEq)]
pub enum TransitionErrorKind {
    DoubleTransition,
    IllegalTransition,
}

#[derive(Debug)]
pub struct TransitionError<T> {
    kind: TransitionErrorKind,
    current_state: T,
    new_state: T,
    pending_state: Option<T>,
}

type Result<T> = std::result::Result<(), TransitionError<T>>;

impl<T: Display> std::fmt::Display for TransitionError<T> {
    fn fmt(&self, f: &mut std::fmt::Formatter) -> std::fmt::Result {
        match self.kind {
            TransitionErrorKind::DoubleTransition => {
                write!(f, 
                    "Double transition: {}. Pending transition is {} -> {}", 
                    self.new_state, self.current_state, self.pending_state.as_ref().unwrap()
                )
            },
            TransitionErrorKind::IllegalTransition => {
                write!(f, "Illegal transition: {} -> {}", self.current_state, self.new_state)
            },
        }
    }
}

pub struct Fsm<T> {
    states: Vec<State>,
    current_state: Option<T>,
    pending_state: Option<T>,
}

impl<T> Fsm<T> 
where T: Into<u32> + Into<usize> + Copy + StateEnum {
    pub fn new(initial_state: T) -> Fsm<T> {
        Fsm {
            states: std::iter::repeat_with(|| State {
                on_enter: None,
                on_update: None,
                on_exit: None,
                transition_mask: 0,
            }).take(T::count()).collect(),
            current_state: None,
            pending_state: Some(initial_state),
        }
    }

    pub fn get_current_state(&self) -> Option<T> {
        self.current_state
    }

    pub fn register_state(&mut self, id: T, mask: u32, cb_on_enter: Option<Box<Callback>>, cb_on_update: Option<Box<Callback>>, cb_on_exit: Option<Box<Callback>>) {
        let index: usize = id.into();
        self.states[index].transition_mask = mask;
        self.states[index].on_enter = cb_on_enter;
        self.states[index].on_update = cb_on_update;
        self.states[index].on_exit = cb_on_exit;
    }

    pub fn trigger(&mut self, new_state: T) -> Result<T> {

        match self.current_state {
            Some(current_state) => {
                // Early out of a pending state is already set
                if let Some(pending_state) = self.pending_state {
                    return Err(TransitionError{
                        kind: TransitionErrorKind::DoubleTransition,
                        current_state: current_state,
                        new_state: new_state,
                        pending_state: Some(pending_state),
                    });
                }

                let current_state_index: usize = current_state.into();

                // Guard against illegal transitions
                if !self.states[current_state_index].can_transition(new_state) {
                    Err(TransitionError{
                        kind: TransitionErrorKind::IllegalTransition,
                        current_state: self.current_state.unwrap(),
                        new_state: new_state,
                        pending_state: None,
                    })
                }
                else {
                    self.pending_state = Some(new_state);
                    Ok(())
                }
            },
            None => {
                self.pending_state = Some(new_state);
                Ok(())
            }
        }
    }

    pub fn update(&mut self) {

        // If there's no pending state, update the current state, otherwise, the transition is the 'update' action
        if self.pending_state.is_none() {
            if let Some(current_state) = self.current_state {
                let current_state_index: usize = current_state.into();
                if let Some(callback) = self.states[current_state_index].on_update.as_mut() {
                    callback();
                }
            }
        }
        else {
            // Update the states first, in case one of the callbacks triggers a new state
            let old_current_state = self.current_state;
            let old_pending_state = self.pending_state;
            self.current_state = self.pending_state;
            self.pending_state = None;

            // If this is the first update tick of the FSM, there may be no current state
            if let Some(current_state) = old_current_state {
                let current_state_index: usize = current_state.into();
                if let Some(callback) = self.states[current_state_index].on_exit.as_mut() {
                    callback();
                }
            }

            // self.pending_state should be guaranteed valid at this point
            let new_state_index: usize = old_pending_state.unwrap().into();
            if let Some(callback) = self.states[new_state_index].on_enter.as_mut() {
                callback();
            }
        }
    }
}

#[macro_export]
macro_rules! cb {
    ($callback:expr) => {
        Some(Box::new($callback))
    }
}

#[cfg(test)]
mod tests {

    use super::*;

    use std::rc::Rc;
    use std::cell::RefCell;

    extern crate decrypto_game_derive;
    use decrypto_game_derive::*;

    #[derive(FsmEnum, PartialEq, Debug)]
    enum TestState {
        Zero,
        One,
        Two,
    }

    #[test]
    fn test_new() {
        let fsm = Fsm::new(TestState::Zero);

        assert!(fsm.current_state.is_none());
        assert!(fsm.pending_state.is_some());
        assert_eq!(fsm.pending_state.unwrap(), TestState::Zero);
        assert_eq!(fsm.states.len(), TestState::count());
    }

    #[test]
    fn test_trigger() {
        let mut fsm = Fsm::new(TestState::Zero);
        fsm.register_state(
            TestState::Zero, 
            mask!(TestState::One),
            None, None, None,
        );

        let result = fsm.trigger(TestState::Two);
        assert!(result.is_err());
        assert_eq!(result.err().unwrap().kind, TransitionErrorKind::IllegalTransition);
        assert!(fsm.pending_state.is_none());

        let result = fsm.trigger(TestState::One);
        assert!(result.is_ok());
        assert_eq!(fsm.pending_state.unwrap(), TestState::One);

        let result = fsm.trigger(TestState::Two);
        assert!(result.is_err());
        assert_eq!(result.err().unwrap().kind, TransitionErrorKind::DoubleTransition);
        assert_eq!(fsm.pending_state.unwrap(), TestState::One);
    }

    #[test]
    fn test_update() {
        let mut fsm = Fsm::new(TestState::Zero);

        let counter_zero = Rc::new(RefCell::new(0));
        let counter_one = Rc::new(RefCell::new(0));

        let state_zero_callback = {
            let counter_zero = Rc::clone(&counter_zero);
            move || {
                *counter_zero.borrow_mut() += 1;
            }
        };
        
        fsm.register_state(
            TestState::Zero, 
            mask!(TestState::One),
            cb!(state_zero_callback.clone()),
            cb!(state_zero_callback.clone()),
            cb!(state_zero_callback.clone()),
        );
        fsm.register_state(
            TestState::One, 
            mask!(TestState::Two), 
            None,
            cb!({
                let counter_one = Rc::clone(&counter_one);
                move || {
                    *counter_one.borrow_mut() += 1;
                }
            }),
            cb!({
                let counter_one = Rc::clone(&counter_one);
                move || {
                    *counter_one.borrow_mut() += 1;
                }
            })
        );
        fsm.register_state(
            TestState::Two, 
            mask!(TestState::Zero), 
            None,
            None,
            None,
        );

        // Base state
        assert!(fsm.current_state.is_none());
        assert_eq!(fsm.pending_state.unwrap(), TestState::Zero);
        assert_eq!(*counter_zero.borrow(), 0);
        assert_eq!(*counter_one.borrow(), 0);
        
        fsm.update();

        // Should reflect zero.on_enter
        assert_eq!(fsm.current_state.unwrap(), TestState::Zero);
        assert!(fsm.pending_state.is_none());
        assert_eq!(*counter_zero.borrow(), 1);
        assert_eq!(*counter_one.borrow(), 0);

        fsm.update();

        // Should reflect zero.update
        assert_eq!(fsm.current_state.unwrap(), TestState::Zero);
        assert!(fsm.pending_state.is_none());
        assert_eq!(*counter_zero.borrow(), 2);
        assert_eq!(*counter_one.borrow(), 0);

        fsm.trigger(TestState::One).unwrap();
        fsm.update();

        // Should reflect zero.on_exit
        assert_eq!(fsm.current_state.unwrap(), TestState::One);
        assert_eq!(*counter_zero.borrow(), 3);
        assert_eq!(*counter_one.borrow(), 0);

        fsm.trigger(TestState::Two).unwrap();
        fsm.update();

        // Should reflect one.on_exit
        assert_eq!(fsm.current_state.unwrap(), TestState::Two);
        assert_eq!(*counter_zero.borrow(), 3);
        assert_eq!(*counter_one.borrow(), 1);

        fsm.trigger(TestState::Zero).unwrap();
        fsm.update();

        // Should reflect zero.on_enter
        assert_eq!(fsm.current_state.unwrap(), TestState::Zero);
        assert_eq!(*counter_zero.borrow(), 4);
        assert_eq!(*counter_one.borrow(), 1);
    }
}