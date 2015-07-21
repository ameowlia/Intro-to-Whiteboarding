require_relative 'candy_jar_martyny'

distribution_a = [5,[1,2,100],[2,5,100],[3,4,100]]
distribution_b = [3,[1,2,4],[2,3,8],[1,1,5]]
test_a = Distributor.new(distributions: distribution_a)
test_b = Distributor.new(distributions: distribution_b)

RSpec.describe Distributor, "#distribute_candy" do
  # it ""
  # expect
end
RSpec.describe Distributor, "#calculate_average" do
  it "should return an integer" do
    expect(test_a.calculate_average).to be_a(Integer)
  end
  it "should distribute the candy and return the average number of candy per jar" do
    expect(test_a.calculate_average).to eq(160)
  end
  it "should distribute the candy and return the average number of candy per jar" do
    expect(test_b.calculate_average).to eq(9)
  end
end
RSpec.describe Distributor, "#distributions" do
  it "Should return the initial array minus the first element." do
    expect(test_a.distributions).to eq([[1,2,100],[2,5,100],[3,4,100]])
  end
  it "Should return the initial array minus the first element." do
    expect(test_b.distributions).to match_array([[1,2,4],[2,3,8],[1,1,5]])
  end
end
RSpec.describe Distributor, "#total_jars" do
  it "Should equal 5 jars" do
    expect(test_a.total_jars).to eq(5) 
  end
  it "Should equal 3 jars" do
    expect(test_b.total_jars).to eq(3) 
  end
end