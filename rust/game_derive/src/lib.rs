

extern crate proc_macro;
use proc_macro::TokenStream;

use quote::quote;
use syn::{parse_macro_input, DeriveInput};

#[proc_macro_derive(FsmEnum)]
pub fn derive_fsmenum(input: TokenStream) -> TokenStream { 
    let ast = parse_macro_input!(input as DeriveInput);
    let name = &ast.ident;

    let count = match ast.data {
        syn::Data::Enum(enum_item) => enum_item.variants.len(),
        _ => panic!("FsmEnum only works on Enums"),
    };

    let token_stream2 = quote! {
        impl StateEnum for #name {
            fn count() -> usize {
                #count
            }
        }

        impl Into<usize> for #name {
            fn into(self) -> usize {
               self as usize
           }
        }

        impl Into<u32> for #name {
            fn into(self) -> u32 {
               self as u32
           }
        }

        impl Copy for #name { }

        impl Clone for #name {
            fn clone(&self) -> #name {
                *self
            }
        }
    };

    TokenStream::from(token_stream2)
}

