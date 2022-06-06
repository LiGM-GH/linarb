# frozen_string_literal: true

##
# Module MatrixAriphmetics
# Handles ariphmetic operations
module MatrixAriphmetics
  def +(other)
    buffer = MyMatrix.new(@matrix.length, @matrix[0].length)
    buffer.matrix = @matrix.map(&:dup).to_a

    buffer.matrix.each_with_index do |line, i|
      line.map.with_index { |elem, j| elem + other.matrix[i][j] }
    end
    buffer
  end

  def *(other)
    raise("Can't multiply! ") unless self.class.can_multiply?(self, other)

    buffer = MyMatrix.new(@matrix.length, other.matrix[0].length)

    each_line_index do |i|
      other.each_column_index do |j|
        buffer[i][j] = other.each_column_index
                            .map do |k|
                              print @matrix[i][k], ' * ', other.matrix[k][j], ', '
                              @matrix[i][k] * other.matrix[k][j]
                            end.sum
        print "\t-> #{buffer[i][j]}"
        puts
      end
    end
    buffer
  end

  def line_sum(changed_line_num, used_line_num, multiplier = 1)
    check_lines!(changed_line_num, used_line_num)
    @matrix[0].length.times do |k|
      @matrix[changed_line_num][k] = @matrix[changed_line_num][k] +
                                     @matrix[used_line_num][k] * multiplier
    end
    self
  end

  def line_multiply(changed_line_num, multiplier)
    check_lines!(changed_line_num)
    @matrix[0].length.times do |k|
      @matrix[changed_line_num][k] =
        @matrix[changed_line_num][k] * multiplier
    end
    self
  end

  def line_change_places(line1, line2)
    check_lines!(line1, line2)
    @matrix[line1], @matrix[line2] = @matrix[line2], @matrix[line1]
    self
  end

  def column_sum(changed_column_num, used_column_num, multiplier = 1)
    @matrix.length.times do |k|
      @matrix[k][changed_column_num] = @matrix[k][changed_column_num] +
                                       @matrix[k][used_column_num] * multiplier
    end
    self
  end

  def column_multiply(changed_column_num, multiplier)
    @matrix.length.times do |k|
      @matrix[k][changed_column_num] =
        @matrix[k][changed_column_num] * multiplier
    end
    self
  end

  def column_change_places(column1, column2)
    buffer = @matrix.map { |line| line[column1] }
    @matrix.length.times { |i| @matrix[i][column1] = @matrix[i][column2] }
    @matrix.length.times { |i| @matrix[i][column2] = buffer[i] }
    self
  end

  def diagonal_plus(arg)
    arg.is_a?(Numeric) && @matrix.length.times { |i| @matrix[i][i] += arg }
    self
  end

  def diagonal_minus(arg) = diagonal_plus(-arg)

  alias cols column_sum
  alias colm column_multiply
  alias colch column_change_places
  alias lins line_sum
  alias linm line_multiply
  alias linch line_change_places
end
