use BlogEngine::models::{User, Post};
fn create_user(username: felt252, email: felt252) -> User{
    let user = User {
        username: username, email: email
    };
    user
}

fn create_post(title: felt252, content: felt252, author: User)->Post{
    let post = Post {title: title, author: author, content: content};
    post
}

