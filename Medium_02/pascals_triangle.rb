=begin

Write a program that computes Pascal's triangle up to a given number of rows.

In Pascal's Triangle each number is computed by adding the numbers to the right and left of the current position in the previous row.

    1
   1 1
  1 2 1
 1 3 3 1
1 4 6 4 1
# ... etc

=end

require 'pry'

class Triangle
  def initialize(num_rows)
    @triangle_rows = Array.new(num_rows)
    @row_counts = get_row_counts(num_rows)
    build_triangle
  end
  
  def rows
    triangle_rows
  end
  
  private
  
  attr_reader :triangle_rows, :row_counts
  
  def build_triangle
    triangle_rows.map!.with_index do |_, num|
      row = []
      row << 1
      ind = 1
      loop do
        break if row.length >= row_counts[num] - 1
        prev_row = triangle_rows[num - 1]
        row << prev_row[ind-1] + prev_row[ind]
        ind += 1
      end
      row << 1 unless num.zero?
      row
    end
  end
  
  def get_row_counts(num_rows)
    counts = []
    num_rows.times do |num|
      counts << num + 1
    end

    counts
  end
end
