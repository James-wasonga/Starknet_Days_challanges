////THIS CODE HAS ANOTHER IMPLEMENTATION IN  DAY 5 LEVEL 2 AS LIBRARY_MANAGEMENT.CAIRO.


use debug::PrintTrait;


#[derive(Copy,Drop)]

struct Book{
title: felt252,
author: felt252,
isbn: felt252,
isAvailable: bool,
}

trait BookTrait {
fn borrowBook (ref self: Book) -> bool;
fn returnBook(ref self: Book) -> bool;
}

impl BookTraitImpl of BookTrait {
fn borrowBook (ref self: Book)-> bool{
self.isAvailable = false;
self.isAvailable



}

fn returnBook(ref self: Book)-> bool{
 self.isAvailable = true;
 self.isAvailable
}
}


fn main(){
let mut book = Book{
title: 'Auditting',
author: 'Patrick',
isbn: 'ZXY',
isAvailable: true,
};

book.borrowBook().print();
book.returnBook().print();
}