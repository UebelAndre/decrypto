/**
 * This file is the main entry for a binary that is only used
 * to create a wasm target
 */

mod app;
mod hello;
mod utils;
mod decrypto { pub mod game; pub mod state; pub mod words; }

use wasm_bindgen::prelude::*;

#[wasm_bindgen]
pub fn init() {
    // Make sure `panic!`s are configured to appear on the browser console
    utils::set_panic_hook();
}

/**
 * 'main' is a no-op and intentionally does nothing
 */
fn main() {}
