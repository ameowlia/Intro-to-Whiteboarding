# Stacks and queues
# Make 1 queue out of 2 stacks

class Stack
  def initialize
    @array = []
  end

  def pop
    @array.pop
  end

  def push(item)
    @array << item
  end

  def peek
    @array.last
  end
end

class Squeue
  def initialize
    @en_stack = Stack.new
    @de_stack = Stack.new
  end

  def enqueue(item)
    @en_stack.push(item)
    fill_dequeue_stack
  end

  def dequeue
    fill_dequeue_stack

    item = @de_stack.pop

    fill_dequeue_stack    # Fill dequeue stack again after a pop to make sure second stack is up-to-date, otherwise peek might be wrong
    return item
  end

  def peek
    @de_stack.peek
  end


  private

  def fill_dequeue_stack
    if @de_stack.peek == nil
      while @en_stack.peek != nil do
          @de_stack.push(@en_stack.pop)
      end
    end
  end
end



puts "\n\n=== stack testing =========================="
s = Stack.new
s.push('a')
s.push('b')
s.push('c')
p s
p s.pop  == 'c'
p s.peek == 'b'


puts "\n=== queue testing =========================="
q = Squeue.new

q.enqueue('a')
q.enqueue('b')
q.enqueue('c')

p q
p q.dequeue     == 'a'
p q.peek        == 'b'
q.enqueue('d')
p q

p q.dequeue     == 'b'
p q.peek        == 'c'

p q.dequeue     == 'c'
p q.peek        == 'd'

p q.dequeue     == 'd'
p q.peek        == nil
