// mod utils;

use wasm_bindgen::prelude::*;

// When the `wee_alloc` feature is enabled, use `wee_alloc` as the global
// allocator.
// #[cfg(feature = "wee_alloc")]
// #[global_allocator]
// static ALLOC: wee_alloc::WeeAlloc = wee_alloc::WeeAlloc::INIT;

// #[wasm_bindgen]
// extern {
//     fn alert(s: &str);
// }

// #[wasm_bindgen]
// pub fn greet() {
//     unsafe {
//         alert("Hello, Decrypto!");
//     }
// }

#[wasm_bindgen]
pub fn hello_world() -> String {
    "Hello, Decrypto".into()
}

#[wasm_bindgen]
pub fn times_two(i: i32) -> i32 {
    i * 2
}

fn main() { }