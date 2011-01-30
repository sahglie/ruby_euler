
def calc_max_path(data)
  data.reverse.inject([]) do |accum, r|
    accum.empty? ? r : r.map.with_index { |v, i| v + [accum[i], accum[i+1]].max }
  end
end


if $0 == __FILE__
  paths = File.readlines("data.txt").map { |l| l.split.map(&:to_i) }
  puts calc_max_path(paths).first
end
