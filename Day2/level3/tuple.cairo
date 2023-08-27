use debug::PrintTrait;

fn main() {
let tup = (500, 6, 8, 12);

let (tup1,tup2,tup3,tup4) = tup;
let sum =tup1 + tup2 + tup3 + tup4;
sum.print();
}
