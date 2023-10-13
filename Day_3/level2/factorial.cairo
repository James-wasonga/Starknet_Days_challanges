use debug::PrintTrait;

fn main(){
    let mut num:u32 = 4;

    let mut result:u32 = 1;

    loop {
        result *= num;
        if num == 1 {
            break;
        }
        num -= 1;

        result.print();
    };

    result.print();
}