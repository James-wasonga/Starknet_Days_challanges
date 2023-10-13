use Debug::PrintTrait;
fn swap<T, impl TPartialOrd: PartialOrd<T>, impl TDrop: Drop<T>(ref data1: T,ref data2: T){
    let mut temp;
    temp = data1;
    data1 = data2;
    data2 = temp;
}

fn main(){
    
}

