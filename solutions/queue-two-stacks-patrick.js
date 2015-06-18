function Queue() {
    this.out = []
    this.in = []
}

// Adds a value into the queue
Queue.prototype.enqueue = function(value) {
    this._swap(this.out, this.in)
    this.in.push( value );
}

// Removes a value from the queue in FIFO order
Queue.prototype.dequeue = function() {
    this._swap(this.in, this.out)
    return this.out.pop();
}

// Swaps the internal array storage if necessary
Queue.prototype._swap = function(from, to) {
    while( from.length !== 0 ) {
        to.push( from.pop() );
    }
}

// Creates a queue instance
var queue = new Queue()

// Enqueue samples
queue.enqueue(1)
queue.enqueue(2)
queue.enqueue(3)

// Dequeue samples
console.log(queue.dequeue())
console.log(queue.dequeue())

// Enqueue sample
queue.enqueue(5)

// Dequeuing one last time
console.log(queue.dequeue())

// Printing the current state of the queue
console.log(queue)
