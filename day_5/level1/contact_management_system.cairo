// You are developing a simple contact management system in Cairo. Create a struct called "Contact" to store information about a person, including "name" (string), "phone" (string), and "email" (string). Implement a method named "printContact" that prints the contact's details in a user-friendly format.

use debug::PrintTrait;
struct Contact {
    name:felt252,
    phone:felt252,
    email: felt252
}

impl ContactPrintImpl of PrintTrait<Contact> {
    fn print(self: Contact) {
        self.name.print();
        self.phone.print();
        self.email.print();
    }
}

fn main(){
    let my_contact = Contact {name: 'John Doe', phone: '0787653234', email: 'johndoe@gmail.com'};
    my_contact.print();
}

