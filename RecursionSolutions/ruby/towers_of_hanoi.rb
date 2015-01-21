# Towers of Hanoi - Ruby

def hanoi(disc, start, helper, destination)
    if disc > 0
        hanoi(disc - 1, start, destination, helper)
        puts "moving disc #{disc} from #{start} to #{destination}"
        hanoi(disc - 1, helper, start, destination)
    end
end
 
hanoi(5, 'start', 'helper', 'end')
