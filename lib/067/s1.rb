load '../018/s1.rb'

if $0 == __FILE__
  values = Graph.load_values_from_file("data.txt")
  puts Graph.new(values).max_path()
end
