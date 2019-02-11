- Snippets
  - Snippets of code that can be used to compose candidate solutions
- Proofs
  - Unit tests that will pass 100% when the function is correct
- DigitArray - the way you generate possible solutions, exhaustive search
  - One-liner - solutions that only require a single line of code
  - Nesting - solutions that nest other solutions inside of them
  - Chains / pipes - send the output from one function into another function's
    input

Single-line solutions are simple enough, but how do we handle composing more
complex functions? We probably just need to add nesting (functions can call
functions) and pipes (outputs from one function are passed to the next
function) - i.e. steal some ideas from the functional programming world.

Ref:
  - [Stephen Wolfram - Computational Universe][1]

  [1]: https://www.youtube.com/watch?v=P7kX7BuHSFI
