# loops

cairo only supports one kind of loop which is the `loop` syntax.

loops allow you to execute statements of code multiple times provided a condition is true

here is an example of a loop implementation

```
use debug::PrintTrait;
fn main() {
    let mut i: usize = 0;
    loop {
        if i > 10 {
            break;
        }
        'again!'.print();
    }
}
```

loop runs infinitely when declared so we need a break statement to exit out of the loop when a certain condition is met.

to run a cairo code with loops we introduce a flag of `--available-gas` for our code to execute since we believe that loops perform expensively so gas is required.
