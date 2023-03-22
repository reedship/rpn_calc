# RPN CALC

## How to Run

`ruby main.rb` to pull up the CLI, enter your expression one character/number at a time or as a single expression seperated by spaces. Quit by typing `q` or `quit` or `close`, or with Control+D.

## How to Test

Some basic tests can be ran with `ruby test.rb` from the root folder.

## Design notes

This was initially a very easy project for me to wrap my head around, however only after 'finishing' the basic implementation did I realise that I had not made a Reverse Polish Notation calculator. I had made something more like a Polish Notation Calculator, backwards. I was calling operands in the wrong order and realised my method of storing both the operators and the operands on the same stack was causing errors.

I wanted this CLI to be completely in vanilla ruby, without using any external libraries. I wanted the code to be extensible past the initial four operators without much/any refactoring, and using ruby allowed me to use the `array.reduce(operator.to_sym` pattern you see on line 38 of `calc.rb`. Off the top of my head all the basic math operators work as intended this way, so operators like `^` and `**` work as well.

Some tradeoffs I made due to time:
	Error handling
	Depth of testing

When the CLI is given an input that isn't a number or an operator it will error out and this is not ideal. However I promised this to be completed by EOD friday 9/30 and I will get this in right at the wire. If given more time I would prioritize error handling and increase the test coverage to account for edge cases.
