##
#  greatest_prod_of_digits(digits)
#  => 40824
#
def greatest_prod_of_digits(digits)
  digits = digits.split("").map(&:to_i)
  0.upto(digits.length-6).inject(0) do |largest, i|
    prod = digits[i, 5].inject(1) { |product, n| product *= n }
    prod > largest ? prod : largest
  end
end


if __FILE__ == $PROGRAM_NAME
  digits = File.readlines(ARGV[0] || "data.txt").first
  $stdout.puts(greatest_prod_of_digits(digits))
end
