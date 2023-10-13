use array::ArrayTrait;
use debug::PrintTrait;

fn average(a: @Array<u32>) -> u32{
    let mut counter: u32 = 0;
    let mut sum: u32 = 0;
    loop {
        if counter == a.len() {
            break;
        }
        sum += *a.at(counter);
        counter+=1;
    };
    let average = sum / counter;

    average
}

fn main() {
    let mut a = ArrayTrait::new();
    a.append(2);
    a.append(1); 

    let f = @a;

    let len = average(f);
    len.print();


}