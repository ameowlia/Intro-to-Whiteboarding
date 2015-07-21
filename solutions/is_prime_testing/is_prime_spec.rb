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