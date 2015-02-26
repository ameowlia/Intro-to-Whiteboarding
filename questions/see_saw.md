#See Saw Array

Given a set of numbers, return true or false if there exists a number in the set in which the sum of all the numbers to the left of this number is equal to the sum of all the numbers to the right of it.

Example: [1,10,2,5,6,9,4,1,4,8,14,6]

Returns true. Why?

###Solutions

``` javascript
function see_saw(array) {
  var len = array.length;
  for (var i = 1; i < len-1; i++) {
    var leftSum = 0, rightSum = 0;

    // Finding the sum at the left of array element at position i
    var j = 0;
    while (j < i) {
      leftSum += array[j];
      j++
    }

    // Finding the sum at the right of array element at position i
    for (var k = len-1; k > i; k--)
      rightSum += array[k];

    // Checking to see if they are equal
    if (leftSum === rightSum)
      return true;
  }
  return false;
}
```