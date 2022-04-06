# frozen_string_literal: true

##
# Module MatrixEnumerating
# Handles enumerating of elements, etc.
module MatrixEnumerating
  def each_line_index(&block)
    @matrix.length.times(&block)
  end

  def each_column_index(&block)
    @matrix[0].length.times(&block)
  end
end
