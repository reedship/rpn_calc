class Calc
  def initialize(arr)
    @stack = []
    @arr = arr.contains_string? ? arr.convert_to_i_array : arr
  end

  def eval()
    # if we are only passed one item, then return the item passed in
    return arr.first if (arr.length == 1)
    arr.each do |i|
      # if the item is a number, add it to the stack
      if (i.match(/[0-9]/) != nil)
        @stack.push(i)
      # for each operator, the only items we need to evaluate are the first two in the stack
      # calling to_sym return the operator string as a symbol that can be passed to the reduce function
      # IE:
      # '+' => :+
      # '-' => :-
      # REF: https://apidock.com/ruby/Enumerable/reduce
      else
        @stack.push(@stack.pop(2).reduce(i.to_sym))
      end
    end
    @stack.first
  end

  # storing these two helper methods as private as they will only be called in the constructor
  def contains_string?()
    self.any? {|i| i.instance_of?(String) }
  end

  def convert_to_i_array(arr)
    # apply the method to_i to each item in the array
    arr.map(&:to_i)
  end
end
