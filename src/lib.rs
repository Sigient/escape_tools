#[macro_use]
extern crate ruru;
extern crate urlencoding;
extern crate marksman_escape;

use std::error::Error;

use ruru::{Class, Object, RString, VM};
use urlencoding::encode;
use marksman_escape::Escape;

class!(EscapeTools);

methods!(
    EscapeTools,
    _itself,

    fn escape(input: RString) -> RString {
        match input {
            Ok(rstr) => {
                let escaped = encode(rstr.to_str());

                RString::new(escaped.as_str())
            }

            Err(e) => {
                VM::raise(e.to_exception(), e.description());

                RString::new("")
            }
        }
    }

    fn escape_html(input: RString) -> RString {
        match input {
            Ok(rstr) => {
                let escaped_bytes = Escape::new(rstr.to_string().bytes()).collect();

                match String::from_utf8(escaped_bytes) {
                    Ok(escaped) => RString::new(escaped.as_str()),

                    Err(_) => {
                        VM::raise(Class::from_existing("RuntimeError"), "escapeHTML failed");

                        RString::new("")
                    }
                }
            }

            Err(e) => {
                VM::raise(e.to_exception(), e.description());

                RString::new("")
            }
        }
    }
);

#[no_mangle]
pub extern fn initialize_escape_tools() {
    Class::new("EscapeTools", None).define(|itself| {
        itself.def_self("escape", escape);
        itself.def_self("escapeHTML", escape_html);
    });
}
