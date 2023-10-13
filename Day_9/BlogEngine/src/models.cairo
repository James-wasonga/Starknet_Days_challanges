#[derive(Copy, Drop)]
struct User {
    username: felt252,
    email: felt252
}

#[derive(Copy, Drop)]
struct Post {
    title: felt252,
    content: felt252,
    author: User,
}