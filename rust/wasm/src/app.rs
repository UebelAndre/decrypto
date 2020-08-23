
extern crate decrypto_game;
use decrypto_game::{
    fsm::*, mask, cb,
};

use super::decrypto::{
    state,
};

use wasm_bindgen::prelude::*;

#[wasm_bindgen]
pub struct App {
    fsm: Fsm<state::AppState>,
}

#[wasm_bindgen]
impl App {

    #[wasm_bindgen(constructor)]
    pub fn new() -> App {

        let mut app = App {
            fsm: Fsm::new(state::AppState::PRE),
        };

        app.fsm.register_state(
            state::AppState::PRE, 
            mask!(state::AppState::GAME), 
            cb!(|| {
                
            }), 
            cb!(|| {

            }),
            cb!(|| {

            }),
        );

        app.fsm.register_state(
            state::AppState::GAME, 
            mask!(state::AppState::PRE, state::AppState::END), 
            cb!(|| {
                
            }), 
            cb!(|| {

            }),
            cb!(|| {

            }),
        );

        app.fsm.register_state(
            state::AppState::END,
            mask!(state::AppState::PRE, state::AppState::GAME), 
            cb!(|| {
                
            }), 
            cb!(|| {

            }),
            cb!(|| {

            }),
        );

        // Tick the fsm
        app.fsm.update();

        app
    }

    pub fn get_state(&self) -> state::AppState {
        self.fsm.get_current_state().expect("Somehow, the FSM has never been updated")
    }

    pub fn tick(&mut self) {
        self.fsm.update();
    }

    pub fn trigger(&mut self, new_state: state::AppState) {
        self.fsm.trigger(new_state).expect("Trigger error");
    }
}
