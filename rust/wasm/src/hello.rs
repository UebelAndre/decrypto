use wasm_bindgen::prelude::*;

#[wasm_bindgen]
extern {
    fn alert(s: &str);
}

#[wasm_bindgen]
pub fn hello_alert() {
    unsafe {
        alert("Alert, Decrypto!");
    }
}

#[wasm_bindgen]
pub fn hello_panic() {
    // utils::set_panic_hook();
    panic!("Oh No!");
}

#[wasm_bindgen]
pub fn hello_world() -> String {
    "Hello, Decrypto".into()
}
