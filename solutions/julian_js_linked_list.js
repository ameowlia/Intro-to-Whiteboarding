function Node(value){
	this.value = value;
	this.pointer = null;
}


function LinkedList(){
	this.head = null;
	this.pointer = null;
	this.size = 0
}

LinkedList.prototype.insertNode = function(value){
	if (this.head === null){
		this.head = new Node(value)
		this.size += 1
	} else {
		var current = this.head;
		while(current.pointer != null){
			current = current.pointer
		}
		current.pointer = new Node(value)
		this.size += 1
	}
}

LinkedList.prototype.walkThroughList = function(){
	var currentNode = this.head
	var index = 0

	while (currentNode != null){
		console.log("index: " + index + " value: " + currentNode.value)
		console.log(this.size)
		currentNode = currentNode.pointer
		index += 1
	}
}

LinkedList.prototype.removeAtIndex = function(value){
	var currentNode = 0
	var nodeInFront = this.head

	while (currentNode < value - 1){
		nodeInFront = nodeInFront.pointer
		currentNode += 1
	}
	var nodeToRemove = nodeInFront.pointer
	nodeInFront.pointer = nodeToRemove.pointer
	this.size -= 1
}

LinkedList.prototype.addValueAtIndex = function(value, index){
	var currentNode = 0
	var nodeBeforeIndex = this.head
	while (currentNode < index - 1){
		nodeBeforeIndex = nodeBeforeIndex.pointer
		currentNode += 1
	}
	var nodeAfterIndex = nodeBeforeIndex.pointer
	nodeBeforeIndex.pointer = new Node(value)
	nodeBeforeIndex.pointer.pointer = nodeAfterIndex
	this.size += 1
}

LinkedList.prototype.reverseLinkedList = function(){
	var currentNode = this.head
	var previousNode = null
	while (currentNode != null){
		var nextNode = currentNode.pointer
		currentNode.pointer = previousNode
		previousNode = currentNode
		currentNode = nextNode
	}
	this.head = previousNode
}

var myList = new LinkedList()

myList.insertNode(1)

myList.insertNode(2)

myList.insertNode(3)

myList.insertNode(4)

myList.insertNode(5)


myList.reverseLinkedList()

myList.walkThroughList()



