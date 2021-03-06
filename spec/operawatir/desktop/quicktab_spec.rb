require File.expand_path('../../watirspec_desktophelper', __FILE__)
require File.expand_path('../shared/shared', __FILE__)

describe 'QuickTab' do

  let(:url1) { "http://t/platforms/desktop/automated/resources/documents/page1.html" }
  let(:url2) { "http://t/platforms/desktop/automated/resources/documents/page2.html" }
  
   let(:widget) { browser.quick_window(:name, "Browser Window").quick_toolbar(:name, "Pagebar").quick_tab(:name, "Tab 0") }
  
   subject { widget }
     
   it_behaves_like "a widget"
   it_behaves_like "a button"
   
  its(:type) { should == :tabbutton }
  
  describe '#quick_tab' do
    before(:all) do
      browser.quick_window(:name, "Document Window").quick_toolbar(:name, "Document Toolbar").quick_addressfield(:name, "tba_address_field").load_page_with_url(url1).should == url1
      browser.load_window_with_action("Document Window", "Open url in new page", url2).should > 0
    end

    it 'constructs tabbutton by its position' do
      browser.quick_window(:name, "Browser Window").quick_toolbar(:name, "Pagebar").quick_tab(:pos, 0).should exist
    end
    it 'constructs tabbutton by its name' do
      browser.quick_window(:name, "Browser Window").quick_toolbar(:name, "Pagebar").quick_tab(:name, "Tab 0").should exist
    end
    it 'constructs tabbutton by its text' do
      browser.quick_window(:name, "Browser Window").quick_toolbar(:name, "Pagebar").quick_tab(:text, "Test Page 1").should exist
    end
    
    after(:all) do
      browser.close_all_tabs
    end
  end
  
  describe '#move_with_drag' do
    describe 'when target is not a tab' do
      it 'raises UnknownObjectException' do
    browser.load_window_with_action("Document Window", "Open url in current page", "http://t/platforms/desktop/automated/resources/documents/page1.html").should > 0
    expect { browser.quick_window(:name, "Browser Window").quick_toolbar(:name, "Pagebar").quick_tab(:text, "Test Page 1").move_with_drag(browser.quick_window(:name, "Browser Window")) }.to raise_error OperaWatir::DesktopExceptions::UnknownObjectException
    end
    end
  end
  
  describe '#activate_tab_with_click' do
    before(:all) do
      browser.quick_window(:name, "Document Window").quick_toolbar(:name, "Document Toolbar").quick_addressfield(:name, "tba_address_field").load_page_with_url(url1).should == url1
      browser.load_window_with_action("Document Window", "Open url in new page", url2).should > 0
    end
    
     it 'returns windowid of window activated' do
       browser.quick_window(:name, "Browser Window").quick_toolbar(:name, "Pagebar").quick_tab(:name, "Tab 0").activate_tab_with_click.should > 0
     end
     
   it 'when the window is already active returns 0' do
         browser.quick_window(:name, "Browser Window").quick_toolbar(:name, "Pagebar").quick_tab(:name, "Tab 0").activate_tab_with_click.should == 0    
     end
         
     context 'when the tab button does not exist' do
       it 'raises UnknownObjectException' do
         expect { browser.quick_window(:name, "Browser Window").quick_toolbar(:name, "Pagebar").quick_tab(:name, "Tab 2").activate_tab_with_click }.to raise_error OperaWatir::Exceptions::UnknownObjectException
       end
     end
     
     context 'when the tab button is not visible' do
       it 'raises WidgetNotVisibleException' #do
    #tab_to_drop_on = browser.quick_window(:name, "Browser Window").quick_toolbar(:name, "Pagebar").quick_tab(:text, "Test Page 2")
    #browser.quick_window(:name, "Browser Window").quick_toolbar(:name, "Pagebar").quick_tab(:text, "Test Page 1").move_with_drag(tab_to_drop_on)
    #expect { browser.quick_window(:name, "Browser Window").quick_toolbar(:name, "Pagebar").quick_tab(:name, "Tab 1").activate_tab_with_click }.to raise_error OperaWatir::DesktopExceptions::WidgetNotVisibleException
     #end
     end

     it 'activates a tab with click' do
       browser.quick_window(:name, "Browser Window").quick_toolbar(:name, "Pagebar").quick_tab(:name, "Tab 0").activate_tab_with_click
       browser.quick_window(:name, "Browser Window").quick_toolbar(:name, "Pagebar").quick_tab(:name, "Tab 0").text.should == "Test Page 1"
       browser.quick_window(:name, "Browser Window").quick_toolbar(:name, "Pagebar").quick_tab(:name, "Tab 1").activate_tab_with_click
       browser.quick_window(:name, "Browser Window").quick_toolbar(:name, "Pagebar").quick_tab(:name, "Tab 1").text.should == "Test Page 2"
     end
  end
 
  #Note this part of api will probably change when new tab grouping is handled
  describe '#group_with_drag' do
  
    it 'raises UnknownObjectException if target is not a tab' 
  
    it 'returns the number of tabs in the tab group'
  
    it 'returns 1 if not a group' 
  
  end
  

  
end