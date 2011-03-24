require File.expand_path('../../watirspec_desktophelper', __FILE__)
require File.expand_path('../shared/shared', __FILE__)

describe 'QuickTreeItem' do
  
  before(:all) do
    browser.open_window_with_key_press("Bookmarks Panel Window", "b", :ctrl, :shift) 
	#browser.quick_treeview(:name, "Bookmarks Folders View").focus_with_click
  end
  
  after(:all) do
    browser.close_all_tabs
  end
  
  let(:widget) { browser.quick_window(:name, "Bookmarks Panel Window").quick_treeview(:name, "Bookmarks View").quick_treeitem(:pos, [0, 0]) }
  subject { widget }
    
  it_behaves_like 'a widget'
  
  its(:type) { should == :treeitem }

  #describe '#correct_type?' do
  #end

  describe '#focus_with_click' do
  
		before(:all) do
			browser.open_dialog_with_action("New Preferences Dialog", "Show preferences").should > 0
			browser.quick_dialogtab(:name, "tab_prefs_advanced").activate_tab_with_click
		end
		
		it 'focus a treeitem' do
			 browser.quick_treeview(:name, "Advanced_treeview").quick_treeitem(:string_id, "D_NEW_PREFS_SHORTCUTS").focus_with_click
			 browser.quick_checkbox(:name, "Mouse_gestures_checkbox").should be_visible
		end
	
		
		after(:all) do
			browser.close_all_dialogs
		end
  end
        
  describe '#expand_with_click' do
		before(:all) do
			browser.open_dialog_with_action("New Preferences Dialog", "Show preferences").should > 0
			browser.quick_dialogtab(:name, "tab_prefs_advanced").activate_tab_with_click
			browser.quick_treeview(:name, "Advanced_treeview").quick_treeitem(:string_id, "D_NEW_PREFS_SHORTCUTS").activate_tab_with_click
			browser.quick_button(:name, "button_keyboard_Edit").open_dialog_with_click("Input Manager Dialog").should > 0
		end
	
		it 'expand with click' do
			browser.quick_treeview(:name, "Input_treeview").quick_treeitem(:text, "Application    (defaults)").expand_with_click
			browser.quick_treeview(:name, "Input_treeview").quick_treeitem(:text, "Copy").visible?.should be_true
		end
		
		it 'collapse with click' do
			browser.quick_treeview(:name, "Input_treeview").quick_treeitem(:text, "Application    (defaults)").expand_with_click
			browser.quick_treeview(:name, "Input_treeview").quick_treeitem(:text, "Copy").visible?.should be_false
		end
		
		it 'raises exception' do
			#browser.close_dialog("Input Manager Dialog").should close_dialog
			lambda { browser.quick_treeview(:name, "Input_treeview").quick_treeitem(:text, "Copy").expand_with_click }.should raise_error OperaWatir::DesktopExceptions::WidgetNotVisibleException
		end
		
		after(:all) do
			browser.close_all_dialogs
		end
  end

  describe '#expand_with_double_click' do
  end
    
   # alias_method :collapse_with_double_click, :expand_with_double_click
    
  describe '#key_press(key, *opts)' do
  end
        
  describe '#selected?' do
  end
     
  describe '#activate_tab_with_click' do
  end
    
  describe '#open_window_with_double_click(win_name)' do
  end
    
   # alias_method :open_dialog_with_double_click, :open_window_with_double_click
    
  #private
  describe '#scroll_item_into_view' do
  end
  
  
end

