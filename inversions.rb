# frozen_string_literal: true

##
# Class LineInvCounter
# Counts the number of inversions in given line
class LineInvCounter
  def initialize
    @a = []
  end

  def from_cli
    @a = gets.split.map(&:to_i)
  end

  def from_string(string)
    @a = string.split.map(&:to_i)
  end

  def inversions
    invs = 0
    last_invs = 0
    @a.length.times do |i|
      i.upto(@a.length - 1) do |j|
        invs += 1 if @a[i] > @a[j]
      end
      print @a[i], "\t", invs - last_invs, "\t", invs
      puts
      last_invs = invs
    end
    invs
  end
end

counter = LineInvCounter.new
puts 'Вводите значения. '
line = '9 25 3 15 18 21 24 14 1 5 8 23 17 19 2 26 30 28 7 20 11 29 27 13 10 22 6 12 4 16'
counter.from_string(line)
print 'Инверсий: ', counter.inversions, "\n"
