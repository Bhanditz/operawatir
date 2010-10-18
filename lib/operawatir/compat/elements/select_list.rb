module OperaWatir::Compat::Elements
  class SelectList < WebElement

    def select(text)
      find_option_by_text(options, text).setSelected
    end
    alias_method :set, :select

    def select_value(value)
      find_option_by_val(options, value).setSelected
    end

    def selected?(text)
      find_option_by_text(options, value).isSelected
    end

    def options
      @options ||= element.findElementsByTagName("option")
    end

    def option(method, value)
      options.find { |option| option.send(method) == value }
    end

  private

    def find_option_by_val(items, value)
#      options.find { |item| item.getValue == value } ||
#        raise OperaWatir::Exceptions::UnknownObjectException,
#          "Unable to locate Option, using :value and #{value.inspect}"
    end

    def find_option_by_text(items, text)
#      items.find { |item| item.getText == text } ||
#        raise OperaWatir::Exceptions::UnknownObjectException,
#          "Unable to locate Option, using :text and #{text.inspect}"
    end
  end

  class Option < WebElement
  end
end
