##
# After a little googling, I found the following reference:
# http://mathforum.org/library/drmath/view/57162.html
#
# Essentially, we can manipulate the formula: T = n(n+1)/2
# and massage it into the form: 8T + 1 = (2n + 1)^2
#
# This implies that if sqrt(8T + 1) is a perfect square and
# an odd integer, then we have a triangle number.
#
def triangle_number?(n)
  r = Math.sqrt(8*n + 1)
  (r.denominator == 1) && r.to_i.odd?
end

def score(word)
  word.each_char.inject(0) { |score, c| score + (c.ord - 64) }
end

if __FILE__ == $PROGRAM_NAME
  file = ARGV[0] || "data.txt"
  words = File.readlines(file).first.split(",").map { |w| w[/\w+/] }
  puts words.select { |wrd| triangle_number?(score(wrd)) }.length
end
