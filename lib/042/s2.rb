
##
# This solution performs about twice as fast as s1.rb (it was also a good
# excuss to try out the 1.9 Enumerator feature) but you have to use
# larger data set to notice it.  To test perf with a larger data set
# use data_L.txt
#
#
# time ruby s1.rb data_L.txt
# => 4.097 secs (avg on 4 runs)
#
# time ruby s2.rb data_L.txt
# => 2.035 secs (avg on 4 runs)
#
class TriEnum
  def initialize
    @largest = 1
    @vals = {@largest => 1}
  end

  def enum(n = 1)
    Enumerator.new do |y|
      loop do
        tri = (n*(n+1))/2
        @vals[tri] = n
        @largest = tri
        y << tri
        n += 1
      end
    end
  end

  def include?(num)
    return true if @vals[num]
    return false if num < @largest
    n = @vals[@largest]
    e = self.enum(n+1)
    loop do
      tri = e.next()
      return true if tri == num
      return false if tri > num
    end
  end
end

def score(word)
  word.each_char.inject(0) { |score, c| score + (c.ord - 64) }
end


if __FILE__ == $PROGRAM_NAME
  file = ARGV[0] || "data_L.txt"
  words = File.readlines(file).first.split(",").map { |wrd| wrd[/\w+/] }
  e = TriEnum.new
  puts words.select { |wrd| e.include?(score(wrd)) }.count
end
