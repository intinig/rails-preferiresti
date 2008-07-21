require File.dirname(__FILE__) + '/../test_helper'
#require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  def test_should_validate_presence_of_body
    assert_no_difference 'WouldYouPrefer.count' do
      w = create_would :body => nil
      assert w.errors.on(:body)
    end
  end
  
  def test_should_validate_presence_of_would_you_prefer_id
    assert_no_difference 'WouldYouPrefer.count' do
      w = create_would :would_you_prefer => nil
      assert w.errors.on(:would_you_prefer_id)
    end
  end
  
  def test_should_validate_existence_of_would_you_prefer
    assert_no_difference 'WouldYouPrefer.count' do
      w = create_would :would_you_prefer => nil
      assert w.errors.on(:would_you_prefer)
    end
  end

protected

  def create_would(options = {})
    Comment.create({:would_you_prefer => would_you_prefers(:one), :body => 'Hello'}.merge(options))
  end
  
end
