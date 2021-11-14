class Matrix
  attr_accessor :matrix
  def initialize(lines_num, elems_in_line) 
    @matrix = [];
    (0..(lines_num-1)).each { @matrix << [] }
    (0..(lines_num-1)).each do |i| 
      (0..(elems_in_line-1)).each { @matrix[i] << 0 } 
    end
  end
  def set_from_cli
    a = @matrix.length
    b = @matrix[0].length
    result = Matrix.new(0, 0)
    (0..(a-1)).each do |i|
      result.matrix << gets.split.map { |i| i.to_i } 
      raise StandardError.new(""), "MatrixError! " unless result.matrix[i].length == b
    end; 
    @matrix = result.matrix
  end;
  def matrix=(arr) 
    a = @matrix.length
    b = @matrix[0].length
    result = Matrix.new(0, 0)
    (0..(a-1)).each do |i|
      result.matrix[i] = arr[i].dup
      raise StandardError.new(""), "MatrixError! " unless result.matrix[i].length == b
    end; 
    @matrix = result.matrix
  end
  def to_s 
    a = @matrix.length
    b = @matrix[0].length
    str = ""
    (0..(a-1)).each do |i|
      str += "|"
      @matrix[i].each do |element|
        str += element.to_s + "\t"
      end
      str += "|\n"
    end
    str
  end
  
  def +(other)
    a = @matrix.length
    b = @matrix[0].length
    buffer = Matrix.new(a, b)
    for i in (0..(a-1)) do 
      buffer.matrix[i] = @matrix[i].dup
    end
    
    for i in (0..(a-1)) do 
      for j in (0..(b-1)) do 
        buffer.matrix[i][j] += other.matrix[i][j]
      end
    end
    buffer
  end
  
  def *(second)
    a = @matrix.length
    b = second.matrix[0].length
    unless second.matrix.length == @matrix[0].length 
      raise StandardError.new "", "Can't multiply! " 
    end
    
    buffer = Matrix.new(a, b)
    
    first = Matrix.new(a, @matrix[0].length)
    for i in (0..(a-1)) do 
      first.matrix[i] = @matrix[i].dup
    end
    for i in 0..(a-1) do 
      for j in 0..(b-1) do 
        element = 0
        for k in 0..(b-1) do
          print first.matrix[i][k]*second.matrix[k][j], " "
          element += first.matrix[i][k]*second.matrix[k][j]
        end
        puts "\t--> " + element.to_s
        buffer.matrix[i][j] = element
      end
    end
    buffer
  end
  
  def lins(linched, linused, mult = 1) line_sum linched, linused, mult; end
  def line_sum(changed_line_num, used_line_num, multiplier)
    (0..(@matrix[0].length-1)).each do |k|
      @matrix[changed_line_num][k] = @matrix[changed_line_num][k] + 
        @matrix[used_line_num][k]*multiplier
    end
    to_s
  end
  
  def linm(linched, mult) line_multiply linched, mult; end
  def line_multiply(changed_line_num, multiplier)
    (0..(@matrix[0].length-1)).each do |k|
      @matrix[changed_line_num][k] = 
        @matrix[changed_line_num][k] * multiplier
    end
    to_s
  end
  
  def linch(line1, line2) line_change_places line1, line2; end
  def line_change_places(line_number_1, line_number_2)
    buffer = @matrix[line_number_2]
    @matrix[line_number_2] = @matrix[line_number_1]
    @matrix[line_number_1] = buffer
    to_s
  end
  
  def cols(colched, colused, mult = 1) column_sum colched, colused, mult; end
  def column_sum(changed_column_num, used_column_num, multiplier)
    (0..(@matrix.length-1)).each do |k|
      @matrix[k][changed_column_num] = @matrix[k][changed_column_num] + 
        @matrix[k][used_column_num]*multiplier
    end
    to_s
  end
  
  def colm(colched, mult) column_multiply colched, mult; end
  def column_multiply(changed_column_num, multiplier)
    (0..(@matrix.length-1)).each do |k|
      @matrix[k][changed_column_num] = 
        @matrix[k][changed_column_num] * multiplier
    end
    to_s
  end
  
  def colch(col1, col2) column_change_places col1, col2; end
  def column_change_places(column1, column2)
    buffer = []
    @matrix.each { |line| buffer << line[column1] }
    @matrix.length.times { |i| @matrix[i][column1] = @matrix[i][column2] }
    @matrix.length.times { |i| @matrix[i][column2] = buffer[i] }
    to_s
  end
end

b = [
    [  -2,  -1,   1,   4,  -2,   2,  -6],
    [  -2,  -2,  -3,  14,   3,   5,  20],
    [   1,   1,  -1,  -2,   1,   0,   5],
    [   3,   2,   3, -16,  -2,  -7, -19]
    ]

a = Matrix.new(b.length, b[0].length)
a.matrix = b

while (print "> "; true) && line = readline;    begin
  puts eval(line).inspect
rescue => c                                   # rescue
  puts c.to_s + "\n" + c.backtrace.join("\n")
end;                                            end

