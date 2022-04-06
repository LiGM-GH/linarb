#!/usr/bin/env ruby
# frozen_string_literal:true

require 'matrix'
require_relative 'matrix_ariphmetics'
require_relative 'matrix_checks'
require_relative 'matrix_cli'
require_relative 'matrix_enumerating'
require_relative 'matrix_extends'
##
# Class Matrix
# Handles matrixes
class MyMatrix
  attr_reader :matrix

  include MatrixAriphmetics
  include MatrixChecks
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

if $PROGRAM_NAME == __FILE__
  b = [
    [-2, -1, 1,   4, -2, 2, -6],
    [-2, -2, -3,  14,  3,  5, 20],
    [1,   1, -1,  -2,  1,  0, 5],
    [3,   2, 3, -16, -2, -7, -19]
  ]

  a = MyMatrix.new(b.length, b[0].length)
  a.matrix = b

  loop do
    print '> '
    line = readline
    break if line =~ /quit/

    begin
      puts eval(line).inspect
    rescue StandardError => e
      puts "#{e}\n#{e.backtrace.join("\n")}"
    rescue SyntaxError => e
      puts e
    end
  end
end
