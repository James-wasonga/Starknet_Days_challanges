// As part of an e-commerce platform, create a struct called "Product" to represent a product, including fields for "name" (string), "price" (uint256), "stockQuantity" (uint32), and "seller" (address). Implement a method named "purchase" that allows a user to buy a product, reducing the stock quantity and transferring the payment to the seller.

use debug::PrintTrait;

#[derive(Copy, Drop)]
struct Product {
    name: felt252,
    price: u256,
    stock_quantity: u32,
    account_balance: u256,
    seller: felt252,
}

trait ProductTrait {
    fn buy_product(ref self: Product);
    fn price(self: @Product) -> u256;
    fn stock_quantity(self: @Product) -> u32;
    fn account_balance(self: @Product) -> u256;
}

impl ProductImpl of ProductTrait {
    fn buy_product(ref self: Product) {
        self.stock_quantity -= 1;
        self.account_balance += self.price;
    }

    fn price(self: @Product) -> u256 {
        *self.price
    }

    fn stock_quantity(self: @Product) -> u32 {
        *self.stock_quantity
    }

    fn account_balance(self: @Product) -> u256 {
        *self.account_balance
    }

}

fn main(){
    let mut my_product = Product {name: 'maize flour', price: 210, stock_quantity: 8, account_balance: 0, seller: '0x'};
    'before purchase'.print();
    my_product.price().print();
    my_product.stock_quantity().print();
    my_product.account_balance().print();

    // purchase
    my_product.buy_product();

    'After purchase'.print();
    my_product.price().print();
    my_product.stock_quantity().print();
    my_product.account_balance().print();

}