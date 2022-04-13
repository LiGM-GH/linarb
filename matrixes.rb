#!/usr/bin/env ruby
# frozen_string_literal:true

require_relative 'matrix_wrapper'
require_relative 'my_matrix'

if $PROGRAM_NAME == __FILE__
  include MatrixWrapper
  # rubocop:disable Lint/UselessAssignment
  a = 0
  b = 0
  c = 0
  d = 0
  # rubocop:enable  Lint/UselessAssignment
  line = 'not empty' # just to enter the loop
  loop do
    print '> ' unless line.empty?
    line = readline.chomp
    break if line =~ /quit|exit/

    begin
      line.empty? || puts(eval(line).inspect)
    rescue StandardError => e
      puts "#{e}\n#{e.backtrace.join("\n")}"
    rescue SyntaxError => e
      puts e
    end
  end
end
