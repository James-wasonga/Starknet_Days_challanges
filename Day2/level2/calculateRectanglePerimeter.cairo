use debug::PrintTrait;

fn calculateRectanglePerimeter(len:u32,wid:u32) ->u32 {
    2 *(len + wid)

}

fn main() {
    let res = calculateRectanglePerimeter(4,6);
    res.print();
}