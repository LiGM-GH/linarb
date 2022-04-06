# frozen_string_literal: true

##
# Module MatrixExtends
# Handles extending of Matrix
# like calling methods inherited from Array
module MatrixExtends
  def [](*args)
    @matrix[*args]
  end

  def respond_to_missing?(*args)
    @matrix.respond_to?(*args)
  end

  def method_missing(*args, &block)
    @matrix.send(*args, &block)
  end
end
