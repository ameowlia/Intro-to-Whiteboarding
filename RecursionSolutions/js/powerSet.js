// Recursive Power Set Solution

var powerset = function(arr, prefix, subsets) {
  subsets = subsets || [];
  prefix  = prefix  || [];
  if (arr.length) {
    powerset(arr.slice(1), prefix.concat(arr[0]), subsets)
    powerset(arr.slice(1), prefix, subsets)
  } else {
    subsets.push(prefix)
  }
  return subsets
};

// console.log(powerset('abcd'));
console.log(powerset('abc'))
