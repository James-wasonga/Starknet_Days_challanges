use BlogEngine::models::{Post,User};
use debug::PrintTrait;

impl postPrintImpl of PrintTrait<Post> {
    fn print(self: Post){
        self.title.print();
        self.content.print();
        self.author.email.print();
        self.author.username.print();
    }
}

fn display_post(post: Post) {
    post.print();
}