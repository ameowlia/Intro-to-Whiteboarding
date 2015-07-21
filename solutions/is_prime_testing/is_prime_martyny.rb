class PrimeNum
  attr_reader :number, :highest_possible_factor
  def initialize(number)
    @number = number
    @highest_possible_factor = Math.sqrt(number)
  end
  def less_than_two?
    number < 2
  end
  def less_than_four?
    number < 4
  end
  def remaining_factors_prime?
    for factor in 2..highest_possible_factor
      false if number%factor == 0 
    end
  end
  def is_prime?
    return false if less_than_two?
    return true if less_than_four?
    return false if number.even? 
    # if they are larger than the sqrt of number, they are redundant
    return false if !remaining_factors_prime?
    true
  end
end

test2 = PrimeNum.new(2)
p test2.is_prime? == true
test3 = PrimeNum.new(6)
p test3.is_prime? == false
test4 = PrimeNum.new(541)
p test4.is_prime? == true #big prime
test5 = PrimeNum.new(461)
p test5.is_prime? == true #big prime
test6 = PrimeNum.new(542)
p test6.is_prime? == false






