# frozen_string_literal: true

##
# Module MatrixCLI
# Handles CLI tools for Matrix
module MatrixCLI
  LINE_LENGTH = 8

  def cli
    result = MyMatrix.new(0, 0)
    @matrix.length.times do |i|
      result.matrix << gets.split.map(&:to_i)
      result.matrix[i].length == @matrix[0].length || raise('Line Length Error')
    end
    @matrix = result.matrix
    self
  end

  def to_s
    @matrix.map do |line|
      "|#{line.map do |element|
            element.to_s.center(LINE_LENGTH)
          end.join}|"
    end.join("\n")
  end

  def inspect
    to_s
  end
end

