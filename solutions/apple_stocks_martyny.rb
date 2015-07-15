# I believe time complexity: O(n), space complexity: O(1)
# There are no nested loops. Min is a loop, but it's not nested.
# None of the variables grow.

def maximum_profit(stock_prices)
  min_price = [stock_prices.index(stock_prices.min), stock_prices.min]
  max_profit = 0
  stock_prices.each_with_index do |price, index|
    if index > min_price[0]
      potential_profit = price - min_price[1]
      max_profit = potential_profit if potential_profit > max_profit
    end
  end
  max_profit
end

# TESTING
random = (40..70).to_a.shuffle
same = Array.new(20, 80)
lose_money = (5..20).to_a.reverse

p "random prices: #{random}"
p "max profit from random prices: #{maximum_profit(random)}"
# TESTS for if prices stay the same or go down
p maximum_profit(same) == 0
p maximum_profit(lose_money) == 0
