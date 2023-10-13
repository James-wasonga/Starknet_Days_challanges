use debug::PrintTrait;

fn main(){
    let width = 30;
	let height = 10;
	let area = width * height;
    let x = 'hello';
    // let x = 'welcome to cairo';

    {
        let x = 'how are you';
        x.print();
    }
    x.print()    
}

