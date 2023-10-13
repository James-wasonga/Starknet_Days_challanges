use debug::PrintTrait;

fn sum_multiples(n: u32, m: u32) -> u32 {
    let mut sum:u32 = 0;
    let mut i = 0;
    loop {
        if(i >= n){
            break;
        }

        if(i % m == 0){
            sum = sum + i;
        }
        i = i + 1;
    };

    sum

}

fn main(){
    let my_sum = sum_multiples(10, 2);
    my_sum.print();
}