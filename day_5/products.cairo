use dict::Felt252DictTrait;
use debug::PrintTrait;

fn add_product(name: felt252, value: u64, ref balances:Felt252Dict<u64> ){
    balances.insert(name, value);
}

fn main(){
    let mut balances: Felt252Dict<u64> = Default::default();
    add_product('Tea', 78, ref balances);


}