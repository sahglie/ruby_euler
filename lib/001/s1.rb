
def sum_multiples(nums, upper_bound)
  (0...upper_bound).inject(0) do |sum, n|
    nums.any? { |num| n % num == 0 } ? sum += n : sum
  end
end


if __FILE__ == $PROGRAM_NAME
  puts sum_multiples([3, 5], 1000)
end
