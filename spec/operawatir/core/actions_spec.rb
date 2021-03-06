require File.expand_path('../../watirspec_helper', __FILE__)

describe OperaWatir::Actions do

  before :each do
    @actions = browser.actions
  end
  
  it 'is available on the browser object' do
    browser.should.respond_to? :actions
    actions = browser.actions
    [:key_down, :key_up, :send_keys, :click_and_hold, :release, :click,
      :double_click, :move_to_element, :move_by_offset, :context_click,
      :drag_and_drop, :perform].each do |method|
      actions.should.respond_to? method
      end
  end

  describe 'keyboard' do
    it 'types on element' do
      browser.url = fixture('input_fields_value.html')

      el = browser.text_field(:id => 'two')
      @actions.send_keys(el, 'abc def').perform()
      el.text.should == 'abc def'
    end

    it 'fires key events' do
      browser.url = fixture('keys.html')

      @actions.send_keys('a').perform()
      window.text.should include 'down, 65, A'
      window.text.should include 'press, 97, a'
      window.text.should include 'up, 65, A'
    end

    it 'fires key events for modifier keys' do
      browser.url = fixture('keys.html')

      @actions.key_down(:control).perform()
      window.text.should include 'down, 17, , ctrl'
      window.text.should_not include 'up, 17'

      browser.actions.key_up(:control).perform()
      window.text.should include 'up, 17'
    end

    it 'combines modifier keys' do
      browser.url = fixture('keys.html')

      @actions.key_down(:control).key_down(:shift).key_up(:control).key_up(:shift).perform()
      window.text.should include 'down, 16, , ctrl,shift'
      window.text.should include 'up, 17, , shift'
    end

    it 'types with shift pressed' do
      browser.url = fixture('input_fields_value.html')
      el = browser.text_field(:id => 'two')

      @actions.key_down(el, :shift).send_keys(el, 'ab').key_up(el, :shift).perform()

      el.text.should == 'AB'
    end

    it 'sends keys to active element' do
      browser.url = fixture('input_fields_value.html')
      el = browser.text_field(:id => 'two')

      el.click()
      @actions.send_keys('ab').perform()

      el.text.should == 'ab'
    end
  end
  
  describe 'mouse' do
    it 'can be used to drag and drop' do
      browser.url = fixture('draggableLists.html')
      dragReporter = browser.p(:id => 'dragging_reports')

      toDrag = browser.li(:id => 'rightitem-3')
      dragInto = browser.ul(:id => 'sortable1')

      dragReporter.text.should == 'Nothing happened.'

      browser.actions.click_and_hold(toDrag).perform()

      browser.actions.move_to_element(browser.li(:id => 'leftitem-4')).perform()

      browser.actions.move_to_element(dragInto).perform()

      dragReporter.text.should == 'Nothing happened. DragOut'

      browser.actions.release(dragInto).perform();

      dragReporter.text.should == 'Nothing happened. DragOut DropIn RightItem 3'

      dragInto.lis.length.should == 6
    end

    it 'drags and drops' do
      browser.url = fixture('draggableLists.html')
      dragReporter = browser.p(:id => 'dragging_reports')

      toDrag = browser.li(:id => 'rightitem-3')
      dragInto = browser.ul(:id => 'sortable1')

      dragReporter.text.should == 'Nothing happened.'

      browser.actions.drag_and_drop(toDrag, dragInto).perform()

      dragReporter.text.should == 'Nothing happened. DragOut DropIn RightItem 3'

      dragInto.lis.length.should == 6
    end

    it 'double clicks' do
      browser.url = fixture('mouse.html')
      el = browser.div(:id => 'test')

      @actions.double_click(el).perform()
      window.text.should include 'dblclick'
    end

    it 'move and double clicks' do
      browser.url = fixture('mouse.html')
      el = browser.div(:id => 'test')

      @actions.move_to_element(el).double_click().perform()
      window.text.should include 'dblclick'
    end
    
    it 'context clicks' do
      browser.url = fixture('mouse.html')
      el = browser.div(:id => 'test')

      @actions.context_click(el).perform()
      window.text.should include 'mouseup 2'
      browser.keys.send(:esc)
    end

    it 'move and clicks' do
      browser.url = fixture('mouse.html')
      el = browser.div(:id => 'test')

      @actions.move_to_element(el).click().perform()
      window.text.should include 'click 0'
    end

    it 'cannot move to a nil element' do
      browser.url = fixture('mouse.html')

      lambda { @actions.click().perform() }.should raise_error
    end

    it 'moves by an offset' do
      browser.url = fixture('mouse.html')

      @actions.move_to_element(browser.pre(:id => 'log')).move_by_offset(1, -30).click().perform()
      window.text.should include 'click 0'
    end
 
  end
  
  describe 'combined' do
    it 'uses form elements' do

    end

    it 'selects multiple items' do
      pending 'getLocation() for OPTION elements is a known bug in OperaDriver'

      browser.url = fixture('formSelectionPage.html')

      options = browser.options()

      @actions.click(options[1]).key_down(:control).click(options[3]).click(options[4]).key_up(:control)
      @actions.perform()

      browser.button(:name => 'showselected').click()

      browser.div(:id => 'result').text.should == 'emmental parmigiano cheddar'
    end

    it 'clicks on links' do
      browser.url = fixture('grid.html')

      @actions.click(browser.link(:text => 'A3')).perform()

      browser.url.should include '#A3'
    end

    it 'clicks on links with an offset' do
      browser.url = fixture('grid.html')

      @actions.move_to_element(browser.link(:text => 'B2'), 1, 1).click().perform()

      browser.url.should include '#B2'
    end
  end

end
