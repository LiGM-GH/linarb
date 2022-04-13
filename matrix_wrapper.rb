# frozen_string_literal: true

require 'matrix'
require_relative 'switch'
require_relative 'wrapper_cli'
require_relative 'wrapper_aryphmetics'

module MatrixWrapper
  ##
  # MatrixWrapper adds some handy methods to use in CLI
  class Wrapper < Matrix
    extend Switch
    extend CLI
    include Aryphmetics
    switch :verbose

    def initialize(*args)
      @params = {}
      super(*args)
    end

    def to_s
      line_length = 2 + max_by { |elem| elem.to_s.length }.to_s.length
      rows.map do |line|
        "|#{line.to_a.map do |element|
              element.to_s.center(line_length)
            end.join}|"
      end.join("\n")
    end

    def inspect
      (@params ||= {})[:verbose] ? super : to_s
    end
  end
end
