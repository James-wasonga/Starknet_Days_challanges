use dict::Felt252DictTrait;
use debug::PrintTrait;

fn get_user(name: felt252,ref marks: Felt252Dict<u64>) -> u64 {
    marks.get(name)
}

fn main() {
    let mut marks: Felt252Dict<u64> = Default::default();

    marks.insert('Alex', 9);
    marks.insert('Maria', 90);
    marks.insert('John', 72);
    let  alex_balance = get_user('Alex', ref marks);
    
    alex_balance.print();
}