# encoding: utf-8
require File.expand_path('../../watirspec_helper', __FILE__)

describe 'DesktopBrowser' do
  before :all do
    browser.url = fixture('simple.html')
  end
  
  describe "#goto" do
    it "loads page"
  end
  
  describe "#quit_opera" do
    it "quits opera without quitting driver"
  end
  
  describe "#quit_driver" do
    it "quits driver"
  end
  
  describe "#restart" do
    it "quits and restarts opera"
  end

  describe "#open_window_with_action" do
    it "opens new window" do
      browser.open_window_with_action("", "New page", "1").should open_window
    end
    
    it "fails for actions not opening a new window"
  end
     
  describe "#load_window_with_action" do
    it "loads window"
    it "fails for actions not loading"
  end

  describe "#open_window_with_key_press" do
    it "opens window"
  end

  describe "#activate_tab_with_key_press" do
    it "activates tab"
  end
   
  describe "#open_dialog_with_url" do
    it "opens dialog"
  end
   
  describe "#close_window_with_action" do
    it "closes dialog"
  end
   
   describe "#close_window_with_key_press" do
     it "closes window"
   end
   
   describe "#close_dialog" do
     it "closes dialog"
   end
     
   describe "#set_alignment_with_action" do
     it "sets alignment"
   end

   describe "#widgets" do
     it "retrieves all widgets"
   end
  
   describe "#quick_windows" do
     it "retrieves all windows"
   end
   
   describe "#open_pages" do
     it "holds open tabs"
   end
   
  describe "#quick_buttons" do
    it "retrieves buttons"
  end
  
  #TODO: Add all other collection types
   
   describe "#window_name" do 
     it "returns empty string for invalid id" do
       browser.window_name(-1).should be_empty
     end
     
     it "returns name for valid id" do
       #browser.window_name(valid_id).should == "Document Window"
     end
   end
    
   describe "#load_page_with_key_press" do
     it "load page"
   end
   
   describe "#open_dialog_with_click" do
     it "opens dialog"
   end

   describe "#path" do
     it "is not be empty" do
       browser.path.should_not be_empty
     end
   end

   describe "#large_preferences_path" do
     it "is not be empty" do
       browser.large_preferences_path.should_not be_empty
     end
   end
 
   describe "#small_preferences_path" do
     it "returns path" do
       browser.small_preferences_path.should_not be_empty
     end
   end
 
   describe "#cache_preferences_path" do
     it "returns path" do
       browser.cache_preferences_path.should_not be_empty
     end
   end

   describe "#mac?" do
   end
   
   describe "#linux?" do
    end

   describe "#driver" do
   end
     
   # @private
   # Special method to access the driver
   #attr_reader :driver
   
   describe "#clear_all_private_data" do
     it "clears private data"
   end
   
   describe "#clear_history" do
     it "clears history"
   end
   
   describe "#clear_cache" do
     it "clears cache" 
   end
   
   describe "#close_all_tabs" do
     it "closes all tabs except last "
   end
   
   describe "#close_all_dialogs" do
     it "closes all dialogs"
   end
   
   describe "#reset_prefs" do
     it "resets prefs" 
   end
   
   describe "#delete_profile" do
     it "deletes profile"
   end
   
   describe "#set_preference" do
     it "sets preference"
   end

   describe "#get_preference" do
     it "gets preference"
   end
       
   describe "#get_default_preference" do
     it "gets default value of preference"
   end
     
   describe "#start_opera" do
     it "starts opera"
   end

   # Gets the parent widget name of which there is none here
   #describe "#parent_widget" do
   #  it "is nil" do
   #   browser.parent_widget.should be_nil
   #  end
   #end
   
   #describe "#window_id" do
   #  it "is nil" do
   #   browser.window_id.should be_nil
   #  end
   #end
end

