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
  
  def lins(linched, linused, mult) line_sum(linched, linused, mult); end
  def line_sum(changed_line_num, used_line_num, multiplier)
    (0..(@matrix[0].length-1)).each do |k|
      @matrix[changed_line_num-1][k] = @matrix[changed_line_num-1][k] + 
        @matrix[used_line_num-1][k]*multiplier
    end
    to_s
  end
  
  def linm(linched, mult) line_multiply(linched, mult); end
  def line_multiply(changed_line_num, multiplier)
    (0..(@matrix[0].length-1)).each do |k|
      @matrix[changed_line_num-1][k] = 
        @matrix[changed_line_num-1][k] * multiplier
    end
    to_s
  end
end

#~ matr1 = Matrix.new 2, 2
#~ puts "Matr1: "
#~ matr1.set_from_cli
#~ puts "Matr1: "
#~ puts matr1.to_s + "\n"

#~ matr2 = Matrix.new 2, 2
#~ puts "Matr2: "
#~ matr2.set_from_cli
#~ puts "Matr2: "
#~ puts matr2.to_s + "\n"

#~ puts "Sum: "
#~ puts (matr1 + matr2).to_s + "\n"
#~ puts "Given: "
#~ puts matr1.to_s + "\nand\n" + matr2.to_s + "\n"

#~ puts "Multiplied: "
#~ puts (matr1 * matr2).to_s + "\n"
#~ puts "Given: "
#~ puts matr1.to_s + "\nand\n" + matr2.to_s + "\n"

b = [
[7,  -2, -4, -6, 1, 0, 0, 0],
[-10, 2, -1, -2, 0, 1, 0, 0],
[-10, 1, -5, -8, 0, 0, 1, 0],
[-7,  1, -3, -5, 0, 0, 0, 1]
]

a = Matrix.new(b.length, b[0].length)
a.matrix = b

while (print "> "; true) && line = readline
begin
  puts eval(line).inspect
rescue => c
  puts c.to_s + "\n" + c.backtrace.join("\n")
end
end
