use debug::PrintTrait;

fn fibonacci_recursive(n: u32) -> u32 {
    if n <= 0 {
        return 0;
    } else if n == 1 {
        return 1;
    } else {
        return fibonacci_recursive(n - 1) + fibonacci_recursive(n - 2);
    }
}

fn main() {
    let n = 10; // Change this value to get a different Fibonacci number in the sequence
    let result = fibonacci_recursive(n);
    result.print();
}