require File.expand_path('../../watirspec_desktophelper', __FILE__)

describe 'QuickWidget' do
    describe '#open_window_with_hover' do
      it 'opens window on hover' do
        browser.quick_window(:name, "Browser Window").quick_toolbar(:name, "Pagebar").quick_tab(:pos, 0).open_window_with_hover.should > 0
      end
    end
    
    describe '#type' do
	
		it 'type:addressfield' do
			browser.quick_toolbar(:name, "Document Toolbar").quick_addressfield(:name, "tba_address_field").type.should == :addressfield
		end
		
		it 'type:button' do
			browser.quick_window(:name, "Document Window").quick_toolbar(:name, "Document Toolbar").quick_button(:name, "tbb_Forward").type.should == :button
		end
		
		it 'type:tabbutton' do
			browser.quick_window(:name, "Browser Window").quick_toolbar(:name, "Pagebar").quick_tab(:name, "Tab 0").type.should == :tabbutton
		end
		
    end
 
    describe '#verify_text' do
	
		it 'verify the text id' do
			browser.open_dialog_with_action("New Preferences Dialog", "Show preferences").should > 0
			browser.quick_button(:name, "button_OK").verify_text("DI_ID_OK").should be_true
			browser.close_dialog("New Preferences Dialog").should > 0
		end
    end
  
    #This is deprecated
    describe '#verify_includes_text' do
	
		it 'verify the include text id' do
			browser.open_dialog_with_action("New Preferences Dialog", "Show preferences").should > 0
			browser.quick_button(:name, "button_OK").verify_includes_text("DI_ID_OK").should be_true
			browser.close_dialog("New Preferences Dialog").should > 0
		end
	
    end
    
    describe 'print_row' do
    end

    describe '#print_widget_info' do
    end

    describe '#focus_with_click' do
		
		it 'should focus the addressfield' do
			browser.quick_toolbar(:name, "Document Toolbar").quick_addressfield(:name, "tba_address_field").focus_with_click
			browser.quick_toolbar(:name, "Document Toolbar").quick_addressfield(:name, "tba_address_field").clear
			browser.quick_toolbar(:name, "Document Toolbar").quick_addressfield(:name, "tba_address_field").type_text("www_address").should == "www_address"
			browser.quick_toolbar(:name, "Document Toolbar").quick_addressfield(:name, "tba_address_field").text.should == "www_address"
		end
	
    end
    
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