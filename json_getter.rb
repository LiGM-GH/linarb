# frozen_string_literal: true

require 'json'

##
# JSONGetter makes it easier to get params from JSON
class JSONGetter
  attr_accessor :source

  def initialize(source = "#{__dir__}/local.json")
    @source = source
  end

  def params
    @params ||= File.open(@source, 'r') do |file|
      JSON.parse(file.read)
    end
  end

  def reload
    @params = File.open(@source, 'r') { |file| JSON.parse(file.read) }
  end
end
