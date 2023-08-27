use debug::PrintTrait;
use traits::{TryInto, Into};
use option::OptionTrait;

fn calculate_power(base: felt252, exponent: u32) -> u32 {
    let mut power = base;
    let mut i = 1;

    loop {
        if i == exponent {
            break;
        }

        power = power * base;
        i += 1;
    };

    power.try_into().unwrap()
} 

fn main(){
    calculate_power(2, 2).print();
}