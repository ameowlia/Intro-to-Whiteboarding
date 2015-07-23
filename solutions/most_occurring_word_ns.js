var mostWords = function words(str) {
  str = str.toLowerCase().replace(/[^\w\s]|_/g, "");
  counter = {};
  var split = str.split(' ');
  for (var i = 0; i < split.length; i++) {
    if(counter[split[i]] === undefined) {
    counter[split[i]] = 1;
    } else {
	counter[split[i]] += 1;   
    }
  }
  	var finalResult = [];
  	var biggest = 1;
  	for (var word in counter) {
    	var value = counter[word];
      if (counter[word] > biggest) {
        finalResult = [];
      }
      	if (counter[word] >= biggest) {
          	finalResult.push(word);
            biggest = counter[word];
        }
    }
  return finalResult;
 }



mostWords("How much wood would a wood chuck chuck if a wood chuck could chuck wood?");
//expect ['wood', 'chuck']
