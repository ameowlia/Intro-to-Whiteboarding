# hacky solution:

def max_subsum(array)
  out = []

  array.each_with_index do |number, index|
    # if the next number doesn't exist, we don't check
    if !array[index+1].nil?

      # if the number i'm looking at + the next number is positive
      if number + array[index+1] > 0

        # and if they're both positive
        if array[index] > 0 && array[index+1] > 0

          # push them into our output array
          out << index
          out << index + 1
        end
      end
    end
  end

  # return the first the first and last
  [out.first, out.last]
end



# BETTER SOLUTION

def max_subsum(numbers)
  last = numbers.count - 1
  hash = Hash.new

  numbers.each_with_index do |number, index|
    hash[index] = (numbers[index..last]).inject(:+)
  end

  start = hash.max_by { |k, v| v }[0]
  p [start, last]
end