# frozen_string_literal: true

# Module Switch
# Makes adding switchable params lightning fast
module Switch
  def switch(*args)
    args.each do |arg|
      define_do(arg)
      define_non_do(arg)
      define_undo(arg)
    end
  end

  def define_do(arg)
    define_method(arg.to_s) do
      @params[:"#{arg}"] = true
    end
  end

  def define_undo(arg)
    define_method("un#{arg}") do
      @params[:"#{arg}"] = false
    end
  end

  def define_non_do(arg)
    define_method("non_#{arg}") do
      @params[:"#{arg}"] = false
    end
  end
end
