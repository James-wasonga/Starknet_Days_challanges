// You are building a library management system in Cairo. Create a struct called "Book" to represent a book, including fields for "title" (string), "author" (string), "isbn" (string), and "isAvailable" (bool). Implement a method named "borrowBook" that marks the book as unavailable when borrowed and "returnBook" that marks it as available when returned.


use debug::PrintTrait;
#[derive(Copy, Drop)]
struct Book {
    title: felt252,
    author: felt252,
    isbn: felt252,
    is_available: bool,
}

trait BookTrait {
    fn borrow_book(ref self: Book);
    fn return_book(ref self: Book);
    fn is_available(self: @Book) -> bool;
}

impl BookImpl of BookTrait {
    fn borrow_book(ref self: Book){
        self.is_available = false;
    }

    fn return_book(ref self: Book){
        self.is_available = true;
    }

    fn is_available(self: @Book) -> bool{
        *self.is_available
    }
}

fn main(){
    let mut book1 = Book {title: 'cracking the coding interview', author: 'Bell labs', isbn: '783474', is_available: true};
    book1.borrow_book();
    book1.is_available().print();
    book1.return_book();
    book1.is_available().print();
}

