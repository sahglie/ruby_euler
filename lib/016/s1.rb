
def sum_n_to_power(n, pow)
  (n**pow).to_s.split("").map(&:to_i).inject(:+)
end

if $0 == __FILE__
  puts sum_n_to_power(2, 1000)
end
