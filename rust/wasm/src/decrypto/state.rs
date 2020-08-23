
extern crate decrypto_game_derive;
use decrypto_game_derive::*;

use decrypto_game::fsm::StateEnum;

use wasm_bindgen::prelude::*;

#[wasm_bindgen]
#[derive(FsmEnum, Debug)]
pub enum AppState {
    PRE,
    GAME,
    END,
}

#[derive(FsmEnum, Debug)]
pub enum GameState {
    ENCRYPT,
    DECRYPT,
}

