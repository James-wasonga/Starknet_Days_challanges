use debug::PrintTrait;

fn main(){
    let num: u32 = 2; // we have a problem here, we are trying to see how cairo can read out negative numbers
    if num > 0 {
        'number is positive'.print();
    } else {
        'number is negative'.print();
    }
}