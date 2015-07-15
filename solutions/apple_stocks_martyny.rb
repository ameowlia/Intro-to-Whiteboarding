# I believe time complexity: O(n), space complexity: O(1)
# There are no nested loops. Min is a loop, but it's not nested.
# The variables are constant.

class Stocks
  attr_reader :possible_prices, :min_value, :min_index, :current_price, :max_profit

  def initialize(args)
    @possible_prices = args[:possible_prices]
    @max_profit = 0
    @current_price = 0
    @min_value = possible_prices.min
    @min_index = possible_prices.index(min_value)
  end

  def potential_profit
    current_price - min_value
  end

  def more_profitable?
    potential_profit > max_profit
  end

  def find_most_profitable
    possible_prices.each_with_index do |price, index|
      if index > min_index
        @current_price = price
        @max_profit = potential_profit if more_profitable?
      end
    end
  end
end

# TESTING
random = [42, 45, 44, 43, 49, 41, 46, 48, 50, 40, 47]
random2 = [44, 48, 50, 46, 43, 47, 41, 45, 40, 42, 49]
same = Array.new(20, 80)
lose_money = (5..20).to_a.reverse

p "random prices: #{random}"
p "max profit from random prices: #{maximum_profit(random)}"
# TESTS for if prices stay the same or go down
p maximum_profit(same) == 0
p maximum_profit(lose_money) == 0
