mod models;
mod database;
mod utils;

use utils::display_post;
use database::{create_user, create_post};

fn main(){
    let user = create_user('felabs', 'info@felabs.xyz');
    let post = create_post('cairo', 'i love cairo soo much', user);
    display_post(post);
}