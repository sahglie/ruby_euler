
def find_largest_product(matrix)
  matrix = matrix.map { |array| array.map(&:to_i) }
  sum = 0
  
  0.upto(16) do |i|
    0.upto(16) do |j|
      m4x4 = extract_4x4_at(i, j, matrix)
      candidate_sum = find_4x4_sum(m4x4)
      sum = candidate_sum if candidate_sum > sum
    end
  end
  sum
end

def find_4x4_sum(matrix)
  sum = 0
  matrix.each do |row|
    result = row.inject(:*)
    sum = result if result > sum
  end
  
  dd = matrix[0][0] * matrix[1][1] * matrix[2][2] * matrix[3][3]
  du = matrix[3][0] * matrix[2][1] * matrix[1][2] * matrix[0][3]  

  sum = dd if dd > sum
  sum = du if du > sum
  sum
end

def extract_4x4_at(row, col, matrix)
  m4x4 = []
  4.times do
    m4x4 << matrix[row][col, 4]
    row += 1
  end
  m4x4
end


if __FILE__ == $PROGRAM_NAME
  matrix = File.readlines("data.txt").map { |l| l.split(" ").map(&:to_i) }
  puts find_largest_product(matrix)
end
