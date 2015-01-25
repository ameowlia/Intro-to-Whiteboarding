// Towers of Hanoi - JavaScripts

function hanoi(disc, start, helper, destination) {
    if (disc > 0) {
        hanoi(disc - 1, start, destination, helper)
        console.log("moving disc "+ disc +" from "+ start +" to "+ destination)
        hanoi(disc - 1, helper, start, destination)
    }
}
 
hanoi(5, 'start', 'helper', 'end')
