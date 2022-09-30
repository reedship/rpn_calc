class Calc
  def initialize()
    @stack = []
  end


  def eval(input_string)
    # if we are passed a full expression, iterate over the expression as if they are individual cli inputs
    if input_string.match(/\s/)
      input_string.split(' ').each do |s|
        handle_input(s)
      end
    else
      # else handle it as a single input
      handle_input(input_string)
    end

    @stack.first
  end

  def handle_input(input_string)
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
    when 'q' || 'exit' || 'close'
      puts "goodbye"
      exit
    else
      operands = @stack.shift(2)
      operator = input_string
      @stack.push(operands.reduce(operator.to_sym))
      puts @stack
    end
  end

end
