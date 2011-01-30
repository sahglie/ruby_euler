
def score(word)
  word.each_char.inject(0) { |score, c| score += (c.ord - 96) }
end

def tri_num?(n)
  tri_nums_upto(n).include?(n)
end

def tri_nums_upto(num)
  (1..num).inject([]) do |tri_ary, n|
    tri = (n*(n+1))/2
    return tri_ary if tri > num
    tri_ary << tri
  end
end


if __FILE__ == $PROGRAM_NAME
  file = ARGV[0] || "data.txt"
  words = File.readlines(file).first.split(",").map { |wrd| wrd[/\w+/].downcase }
  puts words.select { |wrd| tri_num?(score(wrd)) }.count
end
