# input: [5,[1,2,100],[2,5,100],[3,4,100]]
# output: 160

class Distributor
  attr_reader :distributions, :total_jars

  def initialize(args)
    @distributions = args[:distributions][1..-1]
    @total_jars = args[:distributions][0]
    @total_candies = 0
  end

  def distribute_candy
    distributions.each do |jar|
      aggregate_jar_totals(jar)
    end
  end

  def aggregate_jar_totals(jar)
    @total_candies += (jar[1] - jar[0] + 1) * jar[2]
  end

  def average_candies
    @total_candies/total_jars
  end

  def calculate_average
    distribute_candy
    average_candies
  end
end


distribution_a = [5,[1,2,100],[2,5,100],[3,4,100]]
distribution_b = [3,[1,2,4],[2,3,8],[1,1,5]]


first_round = Distributor.new(distributions: distribution_a)
p first_round.calculate_average == 160

second_round = Distributor.new(distributions: distribution_b)
p second_round.calculate_average == 9


