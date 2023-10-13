use array::ArrayTrait;
use debug::PrintTrait;

#[derive(Copy, Drop)]
struct CartItem<T> {
    name: T,
    price: T,
    quantity: T,
}

struct Cart<T> {
    cart_items: Array<CartItem<T>>,
}

trait ShoppingCart<T> {
    fn add_item(ref self: Cart<T>, cart_item: CartItem<T>);
    fn calculate_cart_total(ref self: Cart<T>)->T;
}

trait Priced<T> {
    fn calculate_price(ref self: CartItem<T>) -> T;
}

trait DisplayItem<T> {
    fn display(ref self: CartItem<T>);
}

enum ItemCategory<T> {
    Electronics: T,
    clothing: T,
    groceries: T
}

impl PriceImpl<T, impl TCopy: Copy<T>,impl TDrop: Drop<T>, impl TMul: Mul<T>> of Priced<T> {
    fn calculate_price(ref self: CartItem<T>) -> T {
        self.price * self.quantity
    }
}

impl DisplayImpl<T,impl TPrint: PrintTrait<T>,impl TCopy: Copy<T>,impl TDrop: Drop<T>> of DisplayItem<T> {
    fn display(ref self: CartItem<T>){
        self.name.print();
        self.price.print();
        self.quantity.print();
    }
}




fn main(){
    // let mut cart = ArrayTrait::new();
    let mut cart1:CartItem = CartItem {name: 'shoes', price: 2, quantity: 2};
    cart1.display();
    cart1.calculate_price().print();

}

