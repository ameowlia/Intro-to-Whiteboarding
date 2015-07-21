require_relative 'is_prime_martyny'

RSpec.describe PrimeNum, "#is_prime?" do
 it "returns false if a non-number is parsed" do
  test = PrimeNum.new("yo")
  expect(test.is_prime?).to be false
 end
 it "returns true if a small number is prime" do
  test = PrimeNum.new(2)
  expect(test.is_prime?).to be true
 end
 it "returns false if a small number is not prime" do
  test = PrimeNum.new(6)
  expect(test.is_prime?).to be false
 end
 it "returns false if a large number is not prime" do
  test = PrimeNum.new(542)
  expect(test.is_prime?).to be false
 end
 it "returns true if a large number is prime" do
  test = PrimeNum.new(461)
  expect(test.is_prime?).to be true
 end
end

RSpec.describe PrimeNum, "#less_than_two?" do
 it "returns true if a number is less than 2" do
  test = PrimeNum.new(1)
  expect(test.less_than_two?).to be true
 end
 it "returns false if a number is greater than 2" do
  test = PrimeNum.new(3)
  expect(test.less_than_two?).to be false
 end
end

RSpec.describe PrimeNum, "#less_than_four?" do
 it "returns true if a number is less than 4" do
  test = PrimeNum.new(1)
  expect(test.less_than_four?).to be true
 end
 it "returns false if a number is greater than 4" do
  test = PrimeNum.new(5)
  expect(test.less_than_four?).to be false
 end
end

RSpec.describe PrimeNum, "#remaining_factors_prime?" do
 it "returns false if it's a large non-prime number" do
  test = PrimeNum.new(542)
  expect(test.remaining_factors_prime?).to be false
 end
 it "returns true if it's a large prime number" do
  test = PrimeNum.new(541)
  expect(test.remaining_factors_prime?).to be true
 end
end