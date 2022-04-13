module MatrixWrapper
  ##
  # Aryphmetics makes summing lines more fast
  module Aryphmetics
    def lins(line1, line2, multiplier = 1)
      rows[line1] = Vector[*rows[line1]] + Vector[*rows[line2]] * multiplier
      self
    end

    def linch(line1, line2)
      rows[line1], rows[line2] = rows[line2], rows[line1]
      self
    end

    def linm(line, multiplier)
      rows[line] = Vector[*rows[line]] * multiplier
      self
    end
  end
end
