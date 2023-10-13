
// use array::ArrayTrait;

// // Specify generic type T between the angulars
// fn largest_list<T, impl TDrop: Drop<T>>(l1: Array<T>, l2: Array<T>) -> Array<T> {
//     if l1.len() > l2.len() {
//         l1
//     } else {
//         l2
//     }
// }

// fn main() {
//     let mut l1 = ArrayTrait::new();
//     let mut l2 = ArrayTrait::new();

//     l1.append(1);
//     l1.append(2);

//     l2.append(3);
//     l2.append(4);
//     l2.append(5);

//     // There is no need to specify the concrete type of T because
//     // it is inferred by the compiler
//     let l3 = largest_list(l1, l2);
// }





use array::ArrayTrait;

// Given a list of T get the smallest one.
// The PartialOrd trait implements comparison operations for T
// fn smallest_element<T, impl TPartialOrd: PartialOrd<T>, impl TCopy: Copy<T>, impl TDrop: Drop<T>>(
//     list: @Array<T>
// ) -> T {
//     let mut smallest = *list[0];
//     let mut index = 1;
//     loop {
//         if index >= list.len() {
//             break smallest;
//         }
//         if *list[index] < smallest {
//             smallest = *list[index];
//         }
//         index = index + 1;
//     }
// }

// fn main() {
//     let mut list: Array<u8> = ArrayTrait::new();
//     list.append(5);
//     list.append(3);
//     list.append(10);

//     // We need to specify that we are passing a snapshot of `list` as an argument
//     let s = smallest_element(@list);
//     assert(s == 3, 0);
// }

// #[derive(Drop)]
// struct Wallet<T> {
//     balance: T
// }


// fn main() {
//     let w = Wallet { balance: 3 };
// }


// struct Wallet<T> {
//     balance: T
// }

// impl WalletDrop<T, impl TDrop: Drop<T>> of Drop<Wallet<T>>;

// fn main() {
//     let w = Wallet { balance: 3 };
// }

// #[derive(Drop)]
// struct Wallet<T, U> {
//     balance: T,
//     address: U,
// }

// fn main() {
//     let w = Wallet { balance: 3, address: 14 };
// }



// #[derive(Copy, Drop)]
// struct Wallet<T> {
//     balance: T
// }

// trait WalletTrait<T> {
//     fn balance(self: @Wallet<T>) -> T;
// }

// impl WalletImpl<T, impl TCopy: Copy<T>> of WalletTrait<T> {
//     fn balance(self: @Wallet<T>) -> T {
//         return *self.balance;
//     }
// }

// fn main() {
//     let w = Wallet { balance: 50 };
//     assert(w.balance() == 50, 0);
// }


#[derive(Copy, Drop)]
struct Wallet<T> {
    balance: T
}

/// Generic trait for wallets
trait WalletTrait<T> {
    fn balance(self: @Wallet<T>) -> T;
}

impl WalletImpl<T, impl Tcopy: Copy<T>> of WalletTrait<T> {
    fn balance(self: @Wallet<T>) -> T {
        return *self.balance;
    }
}

/// Trait for wallets of type u128
trait WalletReceiveTrait {
    fn receive(ref self: Wallet<u128>, value: u128);
}

impl WalletReceiveImpl of WalletReceiveTrait {
    fn receive(ref self: Wallet<u128>, value: u128) {
        self.balance += value;
    }
}

fn main() {
    let mut w = Wallet { balance: 50 };
    assert(w.balance() == 50, 0);

    w.receive(100);
    assert(w.balance() == 150, 0);
}