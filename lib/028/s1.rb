if __FILE__ == $PROGRAM_NAME
  sum, incr = 1, 2
  result = 500.times.inject(0) do |accum, i|
    4.times do
      sum += incr
      accum += sum
    end
    incr += 2
    accum
  end

  puts result + 1
end
