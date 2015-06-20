#Recursive polynomial

Write a method to expand nth polynomial, for example:
- (a+b)<sup>2</sup> = a<sup>2</sup> + 2ab + b<sup>2</sup>
- (a+b)<sup>3</sup> = a<sup>3</sup> + 3a<sup>2</sup>*b + 3a*b<sup>2</sup> + b<sup>3</sup>

The above question seems scary, but it actually is only asking for Pascal's triangle:

```
1
1   1
1   2   1
1   3   3   1
1   4   6   4   1
.....
```

* a: Please write a method to calculate the value at a given row/column in Pascal's triangle ( e.g. pascal(4,2)=6 )
* b: Please write a method to print out the entire triangle from 1 to nth level.


###Solutions
Put links to your solutions here :)


----------------------
Bonus. The following problems are all optional and they can be solved beautifully with recursion.

- Mergesort
- Powerset of an array.
- Exponent Method: write a method to calculate the value by given base and power.
- Count the number of nodes in a binary tree( or B-Tree, a BST have more than two children) . Available methods are node.left, node.right.  (or node.children in B-Tree case)
- Sieve of Eratosthenes.
- Tower of Hanoi.
- Traveling Salesperson Problem.
- n-Queens problem.