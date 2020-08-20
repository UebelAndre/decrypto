/**
 * This file is the main entry for a binary that is only used
 * to create a wasm target
 */
extern crate decrypto_game;
pub use decrypto_game::*;

extern crate decrypto_game_derive;
pub use decrypto_game_derive::*;

use wasm_bindgen::prelude::*;

mod hello;
mod utils;

#[wasm_bindgen]
pub fn init() {
    // Make sure `panic!`s are configured to appear on the browser console
    utils::set_panic_hook();

    // TODO: Add more
}

/**
 * 'main' is a no-op and intentionally does nothing
 */
fn main() {}
