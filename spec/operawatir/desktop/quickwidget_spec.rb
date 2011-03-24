require File.expand_path('../../watirspec_desktophelper', __FILE__)

describe 'QuickWidget' do
=begin  
    describe '#open_window_with_hover' do
      it 'opens window on hover' do
        browser.quick_window(:name, "Browser Window").quick_toolbar(:name, "Pagebar").quick_tab(:pos, 0).open_window_with_hover.should > 0
      end
    end
    
    
    describe '#exists' do
      context 'when widget exists' do
        it 'returns true' do
          browser.browser.quick_toolbar(:name, "Document Toolbar").quick_addressfield(:name, "tba_address_field").should exist
        end
      end
      context 'when widget doesn\'t exist' do
        it 'returns false' do
          browser.browser.quick_toolbar(:name, "Document Toolbar").quick_addressfield(:name, "tba_address_field2").should_not exist
        end
      end
    end
=end
    describe '#verify_text' do
      before(:all) do
        browser.open_dialog_with_action("New Preferences Dialog", "Show preferences", 2).should open_dialog
        browser.quick_treeview(:name, "Web_search_treeview").should be_visible
        @last_row = browser.quick_treeview(:name, "Web_search_treeview").num_treeitems - 1
        browser.quick_treeview(:name, "Web_search_treeview").quick_treeitem(:pos, [@last_row,0]).focus_with_click
      end
      
      after(:all) do
        browser.close_dialog("New Preferences Dialog").should close_dialog
      end

      it 'verifies simple string by string_id' do
			 browser.quick_button(:name, "button_OK").verify_text("DI_ID_OK").should be_true
      end
      
      it 'verifies strings with string substitution' 

      it 'verifies strings with ampersand' do
        puts "click on item in row #{@last_row}"
        puts browser.string("S_FIND_IN_PAGE")
        puts browser.quick_treeview(:name, "Web_search_treeview").quick_treeitem(:pos, [@last_row,0]).text
        browser.quick_treeview(:name, "Web_search_treeview").quick_treeitem(:pos, [@last_row,0]).verify_text("S_FIND_IN_PAGE").should be_true
      end
    end
=begin  
    #NOTE: This is deprecated
    describe '#verify_includes_text' do
      it 'verifies the include text id' do
			 browser.open_dialog_with_action("New Preferences Dialog", "Show preferences").should > 0
			 browser.quick_button(:name, "button_OK").verify_includes_text("DI_ID_OK").should be_true
			 browser.close_dialog("New Preferences Dialog").should > 0
      end
    end
    
    describe '#focus_with_click' do
      #Not really testable until there's a way to check focus		
      it 'should focus the addressfield' do
			 browser.quick_toolbar(:name, "Document Toolbar").quick_addressfield(:name, "tba_address_field").focus_with_click
      end
	  end
=end   
	  # Private
	  # Also: Test in shared.rb not here
    #describe '#element' do
    #end
  
    #describe '#drag_and_drop_on' do
    #end

    #describe '#parent_widget' do
    #end

    #describe '#row' do
    #end

    #describe '#col' do
    #end
    
    #def window_id
    #end
    
    #describe '#click' do
    #end
    
    #describe '#right_click' do
    #end
    
    #describe '#double_click' do
    #end
    
    #describe '#set_selector' do
    #end
    
    #describe '#find' do
    #end
end