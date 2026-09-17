#![no_std]
#![no_main]

use core::arch::global_asm;
use core::panic::PanicInfo;

global_asm!(include_str!("../entry.S"));

const UART_BASE: usize = 0x1000_0000;

fn putc(c: u8) {
    unsafe {
        (UART_BASE as *mut u8).write_volatile(c);
    }
}

fn puts(s: &str) {
    s.bytes().for_each(putc);
}

#[unsafe(no_mangle)]
pub extern "C" fn kernel_main() -> ! {
    puts("\nHello, Partisan!\n");

    loop {}
}

#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
    loop {}
}
