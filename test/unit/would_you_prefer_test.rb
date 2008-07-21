require 'test_helper'

class WouldYouPreferTest < ActiveSupport::TestCase
  def test_should_require_first_option
    w = WouldYouPrefer.new(:second_option => 'metterti le dita nel naso')
    deny w.save
    assert w.errors
  end
  
  def test_should_require_second_option
    w = WouldYouPrefer.new(:first_option => 'metterti le dita nel naso')
    deny w.save
    assert w.errors
  end
  
  def test_should_cache_number_of_views
    w = WouldYouPrefer.find :first
    assert w.respond_to?(:viewed)
  end
  
  def test_viewed_should_increase_number_of_views
    w = WouldYouPrefer.find :first
    assert_difference('w.viewed') do
      w.view!
    end
  end
end
