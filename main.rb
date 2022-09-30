require_relative './calc'
require 'readline'

calc = Calc.new []
puts "Please begin entering characters for them to be evaluated"

while input_string = Readline.readline("> ",true)
  calc.eval(input_string)
end
