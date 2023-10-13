use debug::PrintTrait;

#[derive(Copy, Drop)]
struct Spacecraft {
    name: felt252,
    position: (u64, u64),
    data_collected: bool,
    launched: bool,
    navigated: bool,
} 

trait SpaceTrait {
    fn launching(ref self: Spacecraft) -> felt252;
    fn navigating(ref self: Spacecraft) -> (u64, u64);
    fn collecting_data(ref self: Spacecraft) -> felt252;
}

impl SpacecraftImpl of SpaceTrait {
    fn launching(ref self: Spacecraft)-> felt252 {
        self.launched = true;
        'launched successfully'
    }

    fn navigating(ref self: Spacecraft) -> (u64, u64) {
        self.navigated = true;
        self.position = (23, 56);
        self.position
    }

    fn collecting_data(ref self: Spacecraft) -> felt252 {
        self.data_collected = true;
        'data collected successfully'
    }


}

fn main(){
    let mut spacecraft = Spacecraft {
        name: 'SPaceX',
        position: (40, 80),
        data_collected: false,
        launched: false,
        navigated: false
    };

    spacecraft.launching().print();
    let (x, y) = spacecraft.navigating();
    x.print();
    y.print();
    spacecraft.collecting_data().print();
}