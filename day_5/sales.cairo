use dict::Felt252DictTrait;
use debug::PrintTrait;

fn get_commission(ref number_of_items: Felt252Dict<u64>, ref sales_amount: Felt252Dict<u64>, person_name: felt252) -> u64 {
    let number = number_of_items.get('person1');
    let sales = sales_amount.get('person1');

    let commission = number * sales * 5/100;
    commission

}

fn main(){
    let mut number_of_items:Felt252Dict<u64> = Default::default();
    let mut sales_amount:Felt252Dict<u64> = Default::default();

    sales_amount.insert('person1', 20);
    number_of_items.insert('person1', 2);

    let commission = get_commission(ref number_of_items, ref sales_amount, 'person1');
    commission.print();
}