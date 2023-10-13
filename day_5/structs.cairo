// #[derive(Copy, Drop)]

// struct User {
//     active: bool,
//     username: felt252,
//     email: felt252,
//     sign_in_count: u64
// }

// fn main(){
//     let mut user1 = User {
//         active: true,
//         username: 'someUsername123',
//         email: 'someoon@example.com',
//         sign_in_count: 1
//     };
//     user1.email = 'anotheremail@example.com';
// }

// fn build_user(email: felt252, username: felt252) -> User {
//     User { active: true, username: username, email: email, sign_in_count: 1,  }
// }

// fn build_user_short(email: felt252, username: felt252) -> User {
//     User { active: true, username, email, sign_in_count: 1,  }
// }

// use debug::PrintTrait;

// struct Rectangle {
//     width: u64,
//     height: u64,
// }

// fn main() {
//     let rectangle = Rectangle { width: 30, height: 10,  };
//     let area = area(rectangle);
//     area.print(); // print out the area
// }

// fn area(rectangle: Rectangle) -> u64 {
//     rectangle.width * rectangle.height
// }

// use debug::PrintTrait;

// struct Rectangle {
//     width: u64,
//     height: u64,
// }

// fn main() {
//     let rectangle = Rectangle { width: 30, height: 10,  };
//     rectangle.print();
// }

// impl RectanglePrintImpl of PrintTrait<Rectangle> {
//     fn print(self: Rectangle) {
//         self.width.print();
//         self.height.print();
//     }
// }


// use debug::PrintTrait;
// #[derive(Copy, Drop)]
// struct Rectangle {
//     width: u64,
//     height: u64,
// }

// trait RectangleTrait {
//     fn area(self: @Rectangle) -> u64;
// }

// impl RectangleImpl of RectangleTrait {
//     fn area(self: @Rectangle) -> u64 {
//         (*self.width) * (*self.height)
//     }
// }

// fn main() {
//     let rect1 = Rectangle { width: 30, height: 50,  };

//     rect1.area().print();
// }



// use debug::PrintTrait;
// #[derive(Copy, Drop)]
// struct Rectangle {
//     width: u64,
//     height: u64,
// }

// trait RectangleTrait {
//     fn width(self: @Rectangle) -> bool;
// }

// impl RectangleImpl of RectangleTrait {
//     fn width(self: @Rectangle) -> bool {
//         (*self.width) > 0
//     }
// }

// fn main() {
//     let rect1 = Rectangle { width: 30, height: 50,  };
//     rect1.width().print();
// }

use debug::PrintTrait;
#[derive(Copy, Drop)]
struct Rectangle {
    width: u64,
    height: u64,
}

trait RectangleTrait {
    fn area(self: @Rectangle) -> u64;
    fn can_hold(self: @Rectangle, other: @Rectangle) -> bool;
}

impl RectangleImpl of RectangleTrait {
    fn area(self: @Rectangle) -> u64 {
        *self.width * *self.height
    }

    fn can_hold(self: @Rectangle, other: @Rectangle) -> bool {
        *self.width > *other.width && *self.height > *other.height
    }
}

fn main() {
    let rect1 = Rectangle { width: 30, height: 50,  };
    let rect2 = Rectangle { width: 10, height: 40,  };
    let rect3 = Rectangle { width: 60, height: 45,  };

    'Can rect1 hold rect2?'.print();
    rect1.can_hold(@rect2).print();

    'Can rect1 hold rect3?'.print();
    rect1.can_hold(@rect3).print();
}

