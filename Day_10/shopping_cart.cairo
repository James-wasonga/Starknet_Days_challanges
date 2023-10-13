// let's work here

use core::traits::IndexView;
use core::traits::Destruct;
use core::traits::Into;
// use core::traits::IndexView;
use debug::PrintTrait;
use array::ArrayTrait;

// Item Category Enum
#[derive(Copy, Drop)]
enum ItemCategory {
    Electronics: felt252,
    Clothing: felt252,
    Groceries: felt252,
}

#[generate_trait]
impl ItemCategoryImpl of ItemCategoryTrait {
    fn process(self: ItemCategory) {
        match self {
            ItemCategory::Electronics(val) => {
                val.print();
            },
            ItemCategory::Clothing(val) => {
                val.print();
            },
            ItemCategory::Groceries(val) => {
                val.print();
            },
        };
    }
}

// Generic structs, traits and methods
#[derive(Copy, Drop)]
struct CartItem<T> {
    name: felt252,
    price: T,
    quantity: T,
    category: ItemCategory
} // if we were to create an array of this... can we loop through them and access their properties directly? - Yes, lets try it

// Priced trait
trait Priced<T> {
    fn calculate_price(self: @CartItem<T>) -> T;
}

// what does the mul trait do? - It will help do the multiplication - where did you get that one from - 
// I was hovering over my errors and reading through, then copied what was happening with Copy and Print
impl PricedImpl<T, impl TCopy: Copy<T>, impl TMul: Mul<T>> of Priced<T> {
    fn calculate_price(self: @CartItem<T>) -> T {
        return (*self.price) * (*self.quantity);
    }
}

// Display trait
trait DisplayItem<T> {
    fn display_info(ref self: CartItem<T>);
}


impl DisplayItemImpl<
    T,
    impl TCopy: Copy<T>,
    impl TDrop: Drop<T>,
    impl TPrint: PrintTrait<T>, // where can i get references to these generics - I have no direct Idea, .. where did you learn about it 
    impl TDestruct: Destruct<T> // so what I did was to start coding while testing, alafu pia the cairo language server autocomplete plus the error shouting helped me know what to do, there is not direct link online i'm gonna start using that
> of DisplayItem<T> {
    fn display_info(ref self: CartItem<T>) {
        self.price.print();
        self.name.print();
        self.quantity.print();
        self.category.process();
    }
}


#[derive(Drop)]
struct ShoppingCart<T> {
    cart_items: Array<T>
}

#[generate_trait]
impl ShoppingCartImpl<T, impl TDrop: Drop<T>> of ShoppingCartTrait<T> {
    fn add_cart_item(ref self: ShoppingCart<T>, item: T) {
        self.cart_items.append(item);
    }

    fn get_items_count(self: @ShoppingCart<T>) -> u32 {
        self.cart_items.len()
    }

    // na tukijaribu na ref -- ooh

    fn get_cart_total(ref self: ShoppingCart<T>,cart_items: @Array<CartItem<u32>>) -> u32 {
        let mut total = 0;
        let mut counter = 0;
        let cart_items_count = cart_items.len();

        loop {
            if (counter >= cart_items_count) {
                break;
            }

            let item = *cart_items[counter];
            total += item.calculate_price();
            counter += 1;
        };
        total
    }
}

// did you implement a method to display the single cart item - Yes

fn main() {
    // Create cart items using the CartItem struct
    let mut item_1 = CartItem {
        name: 'Bread', price: 4, quantity: 1, category: ItemCategory::Groceries('Bakery')
    };
    // Lets display item_1 hahaha
    // item_1.display_info();

    let mut item_2 = CartItem {
        name: 'Oppo A1K',
        price: 8,
        quantity: 1,
        category: ItemCategory::Electronics('Mobile Phones')
    };
    let mut item_3 = CartItem {
        name: 'Black XL Hood',
        price: 7,
        quantity: 1,
        category: ItemCategory::Clothing('Women`s Wear')
    };
    let mut item_4 = CartItem {
        name: 'Bata Shoes',
        price: 2,
        quantity: 1,
        category: ItemCategory::Clothing('School children`s Wear')
    };

    let mut cart_items = ArrayTrait::<CartItem<u32>>::new();
    cart_items.append(item_1);
    cart_items.append(item_2);
    cart_items.append(item_3);
    cart_items.append(item_4);
    let mut counter = 0;
    // Inalenga, but it should work
    loop {
        if(counter >= cart_items.len()){
            break;
        }
        // Accessing items using index returns a snapshot @ so desnaping should take place here
        let item: CartItem = *cart_items[counter];
        item.price.print();
        counter += 1;
    };
    // Try running it - imekubali - Uko wapi -- Will join you, we angalia angalia
    

    // item_1.calculate_price().print();
    // item_1.display_info();

    // Initialize a new cart
    let mut shopping_cart: ShoppingCart = ShoppingCart {
        cart_items: ArrayTrait::<CartItem<u32>>::new()
    };

    // Using the add_cart_item add the items
    shopping_cart.add_cart_item(item_1);
    shopping_cart.add_cart_item(item_2);
    shopping_cart.add_cart_item(item_3);
    shopping_cart.add_cart_item(item_4);
    // let item1 = shopping_cart.cart_items[1];
    // item1.calculate_price().print();

    // Get the cart items count here using the get_items_count method
    // shopping_cart.get_items_count().print();
    // Get cart total here
    // shopping_cart.get_cart_total(@shopping_cart.cart_items).print();
    
}
