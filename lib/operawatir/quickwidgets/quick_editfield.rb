module OperaWatir
  class QuickEditField < QuickWidget

    # @private
    # Checks the type of the widget is correct
    def correct_type?
      @element.getType == WIDGET_ENUM_MAP[:editfield]
    end

    ######################################################################
    # Set focus to the edit field by clicking on it
    #
    def focus_with_click
      super
    end
        
    ######################################################################
    # Types a text string into the edit field
    #
    # @note Only chanracters that appear on the keyboard that is currently
    #       selected can be typed
    #
    # @param [String] text text string to type in
    # 
    # @return [String] contents of the edit field after typing has completed
    #
    def type_text(text)
      text.each_char { | t | key_press t }
      
      # No event yet so just cheat and sleep
      sleep(0.2);

      # Return what is in the field to check
      element(true).getText
    end

    ######################################################################
    # Clears the contents of the edit field
    #
    def clear
      key_press("a", :ctrl)
      key_press("backspace")
      
      # Cheat until we have an event
      sleep(0.2)
    end

private    
    # Presses the key, and waits for loading to finish
    def load_page_with_key_press(key, *modifiers)
      wait_start
      key_press(key, *modifiers)
      wait_for_window_loaded("")
    end

    # Enter some text and hit enter to do the action for the field
    def enter_text_and_hit_enter(text)
      loaded_url = ""
      
      # Set focus
      focus_with_click()
      # Clear the field
      clear()
      # Type in the text
      typed_text = type_text(text)
      
      # Check that the typing matched what was expected
      if typed_text == text
        # Hit Enter to load the typed in url
        win_id = load_page_with_key_press("Enter")
        
        # Check that the page actually loaded in a window
        if win_id > 0
          # Refresh the control and get the text after the page as loaded
          loaded_url = element(true).getText
        end
      end
      
      loaded_url
    end

  end
end