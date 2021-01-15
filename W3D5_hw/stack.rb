class Stack
  def initialize
    @stack = Array.new
  end

  def push(el)
    @stack.unshift(el)
  end

  def pop
    @stack.shift
  end

  def peek
    @stack.first
  end
end
