class Queue
  def initialize
    @queue = Array.new
  end

  def enqueue(el)
    @queue << (el)
  end

  def dequeue
    @queue.shift
  end

  def peek
    @queue.first
  end
end
