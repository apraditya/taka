require File.expand_path('../../test_helper', __FILE__)

class Level2EventsTest < Test::Unit::TestCase
  attr_reader :window

  def setup
    @window = Taka::Window.new
  end
  
  test "Window implements the EventTarget interface" do
    assert window.respond_to?(:addEventListener)
    assert window.respond_to?(:removeEventListener)
    assert window.respond_to?(:dispatchEvent)
  end
  
  test "Window#parent: If a window does not have a parent, its parent property is a reference to itself" do
    assert_equal window, window.parent
  end
  
  test "Window#parent: When a window is loaded in an <iframe> its parent is the window with the element embedding the window" do
  end
  
  test "Window#location: returns the Location object" do
  end
  
  test "Window#setTimeout: Executes a code snippet after specified delay." do
    # var timeoutID = window.setTimeout(func, delay, [param1, param2, ...]);
    # var timeoutID = window.setTimeout(code, delay);
    # where
    # 
    # timeoutID is the ID of the timeout, which can be used later with window.clearTimeout.
    # func is the function you want to execute after delay milliseconds.
    # code in the alternate syntax, is a string of code you want to execute after delay milliseconds. (Using this syntax is not recommended for the same reasons as using eval())
    # delay is the number of milliseconds (thousandths of a second) that the function call should be delayed by.
  end
  
  test "Window#setTimeout: Executes a function after specified delay." do
  end
  
  test "Window#getComputedStyle: returns the computed style of an element" do
    # var style = window.getComputedStyle(element, pseudoElt);
    # element is an element.
    # pseudoElt is a string specifying the pseudo-element to match. Must be null for regular elements.
    # style is a CSSStyleDeclaration object.
  end
end