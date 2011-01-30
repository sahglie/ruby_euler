
def first_ten_digits_of_sum(nums)
  s = nums.inject(0) { |sum, n| sum + n }
  s.to_s[0, 10].to_i
end


if $0 == __FILE__
  nums = File.readlines('data.txt').map(&:to_i)
  puts first_ten_digits_of_sum(nums)
end
