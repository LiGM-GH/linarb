# frozen_string_literal:true

class Matrix
  attr_accessor :matrix, :options

  LINE_LENGTH = 8

  def report
    @options[:report] = true
  end

  def unreport
    @options[:report] = false
  end

  def initialize(lines_num, elems_in_line)
    @matrix = []
    lines_num.times do
      matrix << Array.new(elems_in_line) { 0 }
    end
    self
  end

  def cli
    a = @matrix.length
    b = @matrix[0].length
    result = Matrix.new(0, 0)
    (0..(a - 1)).each do |i|
      result.matrix << gets.split.map(&:to_i)
      raise StandardError.new(''), 'MatrixError! ' unless result.matrix[i].length == b
    end
    @matrix = result.matrix
    self
  end

  def matrix=(arr)
    a = @matrix.length
    b = @matrix[0].length
    result = Matrix.new(0, 0)
    a.times do |i|
      result.matrix[i] = arr[i].dup
      raise StandardError.new(''), 'MatrixError! ' unless result.matrix[i].length == b
    end
    @matrix = result.matrix
  end

  def to_s
    str = ''
    @matrix.each do |line|
      str += '|'
      line.each do |element|
        str += element.to_s.center(LINE_LENGTH)
      end
      str += "|\n"
    end
    str
  end

  def +(other)
    a = @matrix.length
    b = @matrix[0].length
    buffer = Matrix.new(a, b)
    a.times do |i|
      buffer.matrix[i] = @matrix[i].dup
    end

    a.times do |i|
      b.times do |j|
        buffer.matrix[i][j] += other.matrix[i][j]
      end
    end
    buffer
  end

  def *(other)
    a = @matrix.length
    b = other.matrix[0].length
    raise StandardError.new '', "Can't multiply! " unless other.matrix.length == @matrix[0].length

    buffer = Matrix.new(a, b)

    first = Matrix.new(a, @matrix[0].length)
    a.times do |i|
      first.matrix[i] = @matrix[i].dup
    end
    a.times do |i|
      b.times do |j|
        element = 0
        b.times do |k|
          print first.matrix[i][k] * other.matrix[k][j], ' '
          element += first.matrix[i][k] * other.matrix[k][j]
        end
        puts "\t--> " + element.to_s
        buffer.matrix[i][j] = element
      end
    end
    buffer
  end

  def lins(linched, linused, mult = 1)
    line_sum linched, linused, mult
  end

  def line_sum(changed_line_num, used_line_num, multiplier)
    @matrix[0].length.times do |k|
      @matrix[changed_line_num][k] = @matrix[changed_line_num][k] +
                                     @matrix[used_line_num][k] * multiplier
    end
    self
  end

  def linm(linched, mult)
    line_multiply linched, mult
  end

  def line_multiply(changed_line_num, multiplier)
    (0..(@matrix[0].length - 1)).each do |k|
      @matrix[changed_line_num][k] =
        @matrix[changed_line_num][k] * multiplier
    end
    self
  end

  def linch(line1, line2)
    line_change_places line1, line2
  end

  def line_change_places(line1, line2)
    buffer = @matrix[line2]
    @matrix[line2] = @matrix[line1]
    @matrix[line1] = buffer
    self
  end

  def cols(colched, colused, mult = 1)
    column_sum colched, colused, mult
  end

  def column_sum(changed_column_num, used_column_num, multiplier)
    (0..(@matrix.length - 1)).each do |k|
      @matrix[k][changed_column_num] = @matrix[k][changed_column_num] +
                                       @matrix[k][used_column_num] * multiplier
    end
    self
  end

  def colm(colched, mult)
    column_multiply colched, mult
  end

  def column_multiply(changed_column_num, multiplier)
    (0..(@matrix.length - 1)).each do |k|
      @matrix[k][changed_column_num] =
        @matrix[k][changed_column_num] * multiplier
    end
    self
  end

  def colch(col1, col2)
    column_change_places col1, col2
  end

  def column_change_places(column1, column2)
    buffer = []
    @matrix.each { |line| buffer << line[column1] }
    @matrix.length.times { |i| @matrix[i][column1] = @matrix[i][column2] }
    @matrix.length.times { |i| @matrix[i][column2] = buffer[i] }
    self
  end

  def inspect
    to_s
  end
end

def quit
  exit
end

b = [
  [-2, -1, 1, 4, -2,   2, -6],
  [-2,  -2, -3,  14,   3, 5, 20],
  [1,   1, -1, -2, 1, 0, 5],
  [3,   2, 3, -16, -2, -7, -19]
]

a = Matrix.new(b.length, b[0].length)
a.matrix = b

loop do
  print '> '
  line = readline
  begin
    puts eval(line).inspect
  rescue StandardError => e
    puts "#{e}\n#{e.backtrace.join("\n")}"
  end
end
