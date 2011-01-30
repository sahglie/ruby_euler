load '../018/s2.rb'

if $0 == __FILE__
  values = File.readlines("data.txt").map { |l| l.split.map(&:to_i) }
  puts calc_max_path(values)
end
