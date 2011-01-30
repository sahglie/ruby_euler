
def b2_b10_palindromes(upperbound)
  (1...upperbound).select do |n|
    b10, b2 = n.to_s, n.to_s(2)
    (b10 == b10.reverse) && (b2 == b2.reverse)
  end
end


if __FILE__ == $PROGRAM_NAME
  puts b2_b10_palindromes(1_000_000).inject(:+)
end
