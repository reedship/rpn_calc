class Calc
  attr_accessor :arr
  def initialize(arr)
    @stack = []

  end


  def eval(input_string)
    case input_string
      # if the item is a number, add it to the stack
    when /\d/
        @stack.push(input_string.to_f)
      # for each operator, the only items we need to evaluate are the first two in the stack
      # calling to_sym return the operator string as a symbol that can be passed to the reduce function
      # IE:
      # '+' => :+
      # '-' => :-
      # '*' => :*
      # REF: https://apidock.com/ruby/Enumerable/reduce
    when 'exit' || 'close'
      puts "goodbye"
      exit
    else
      operands = @stack.shift(2)
      operator = input_string
      @stack.push(operands.reduce(operator.to_sym))
      puts @stack
    end
    @stack.first
  end
end
