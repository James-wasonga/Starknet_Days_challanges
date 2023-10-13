use debug::PrintTrait;

fn area(len: u32, wid: u32) -> u32 {
    len * wid
}

fn main(){
    let a = area(3,2);
    a.print();
}