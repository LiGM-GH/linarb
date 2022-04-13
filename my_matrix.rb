# frozen_string_literal: true

require_relative 'matrix_ariphmetics'
require_relative 'matrix_checks'
require_relative 'matrix_cli'
require_relative 'matrix_enumerating'
require_relative 'matrix_extends'

##
# Class MyMatrix
# Handles matrixes
class MyMatrix
  attr_reader :matrix

  include MatrixAriphmetics
  include MatrixChecks
  extend ToExtend
  include MatrixCLI
  include MatrixEnumerating
  include MatrixExtends

  def initialize(lines_num, elems_in_line)
    @matrix = []
    lines_num.times do
      matrix << Array.new(elems_in_line) { 0 }
    end
  end

  def matrix=(arr)
    a = @matrix.length
    b = @matrix[0].length
    result = MyMatrix.new(0, 0)
    a.times do |i|
      result.matrix[i] = arr[i].dup
      raise StandardError.new(''), 'MatrixError! ' unless result.matrix[i].length == b
    end
    @matrix = result.matrix
  end
end
