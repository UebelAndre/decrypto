
extern crate decrypto_game;
use decrypto_game::{
    fsm::*, mask, cb,
};

use super::state::GameState;
use super::words;

struct Game {
    fsm: Fsm<GameState>,
    word_list: words::WordList,
}

impl Game {
    pub fn new() -> Game {

        let mut game = Game {
            fsm: Fsm::new(GameState::DECRYPT),
            word_list: words::generate_word_list(),
        };
        

        game.fsm.register_state(
            GameState::DECRYPT,
            mask!(GameState::ENCRYPT),
            cb!(|| {
                
            }),
            cb!(|| {
                
            }),
            cb!(|| {

            }),
        );

        game.fsm.register_state(
            GameState::ENCRYPT,
            mask!(GameState::DECRYPT),
            cb!(|| {

            }),
            cb!(|| {

            }),
            cb!(|| {
                
            }),
        );

        game
    }
}
