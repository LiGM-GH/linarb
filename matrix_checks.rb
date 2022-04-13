# frozen_string_literal: true

##
# Module MatrixChecks
# Handles checking if "number" is line or column, etc.
module MatrixChecks
  def line?(line)
    (0...@matrix.length).include?(line)
  end

  def column?(column)
    (0...@matrix.length).include?(column)
  end

  def check_lines!(*lines)
    errors = []
    lines.each do |line|
      errors << line unless line?(line)
    end
    raise "Lines not found: #{errors.join(', ')}" unless errors.empty?
  end

  def check_columns!(*columns)
    errors = 0
    columns.each do |column|
      errors += 1 unless column?(column)
    end
    raise "Line not found: #{line}" unless errors.zero?
  end
end

module ToExtend
  def can_multiply?(first, second)
    second.matrix.length == first[0].length
  end
end
