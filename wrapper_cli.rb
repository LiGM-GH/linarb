# frozen_string_literal: true

require_relative 'json_getter'

module MatrixWrapper
  ##
  # MatrixWrapper::CLI adds cli method when extended
  module CLI
    def cli
      args = arguments_for_matrix
      args.any? ? self[*args] : nil
    end

    def arguments_for_matrix
      @json ||= JSONGetter.new
      delimiter = @json.params['end_delimiter']
      result = readline(delimiter)
               .delete_suffix(delimiter)
               .split("\n")
      result.map { |elem| elem.split.map(&:to_i) }
    end
  end
end
