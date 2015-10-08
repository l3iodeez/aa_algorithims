class MyStack

  def initialize
    @store = []
  end

  def pop
    @store.pop
  end

  def push(arg)
    @store.push({:val => arg,
        :max => ((peek.nil? || arg > peek[:max]) ? arg : peek[:max]),
        :min => ((peek.nil? || arg < peek[:min]) ? arg : peek[:min])
      })
  end

  def peek
    @store.last
  end

  def size
    @store.count
  end

  def empty?
    @store.empty?
  end

  def max
    peek == nil ? nil : peek[:max]
  end

  def min
    peek == nil ? nil : peek[:min]
  end


end

class StackQueue

  def initialize
    @inbox = MyStack.new
    @outbox = MyStack.new
    @max = nil
    @min = nil
  end

  def enqueue(arg)
    @inbox.push(arg)
  end

  def dequeue
    if @outbox.empty?
      @outbox.push(@inbox.pop) until @inbox.empty?
    end
    @outbox.pop
  end

  def size
    @inbox.size + @outbox.size
  end

  def empty?
    @inbox.empty? && @outbox.empty?
  end

  def max
    @inbox.peek[:max] > @outbox.peek[:max] ? @inbox.peek[:max] : @outbox.peek[:max]
  end

  def min
    @inbox.peek[:min] > @outbox.peek[:min] ? @inbox.peek[:min] : @outbox.peek[:min]
  end

end
