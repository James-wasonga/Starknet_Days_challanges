use array::ArrayTrait;
use debug::PrintTrait;

fn largest_list<T, impl TDrop: Drop<T>>(l1: Array<T>, l2: Array<T>) -> Array<T> {
    if l1.len() > l2.len() {
        l1
    }else{
        l2
    }
}

fn main(){

    let mut arr1 = ArrayTrait::new();
    let mut arr2 = ArrayTrait::new();
    arr1.append(1);
    arr1.append('hello');
    arr2.append(4);
    arr2.append(6);
    arr2.append(8);

    largest_list(arr1, arr2).print();
}