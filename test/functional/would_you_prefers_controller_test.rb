require File.dirname(__FILE__) + '/../test_helper'
#require 'test_helper'

class WouldYouPrefersControllerTest < ActionController::TestCase
  include AuthenticatedTestHelper
  
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:would_you_prefers)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_would_you_prefer
    assert_difference('WouldYouPrefer.count') do
      post :create, :would_you_prefer => superclassica
    end

    assert_redirected_to would_you_prefer_path(assigns(:would_you_prefer))
  end

  def test_should_show_would_you_prefer
    get :show, :id => would_you_prefers(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => would_you_prefers(:one).id
    assert_response :success
  end

  def test_should_update_would_you_prefer
    put :update, :id => would_you_prefers(:one).id, :would_you_prefer => { }
    assert_redirected_to would_you_prefer_path(assigns(:would_you_prefer))
  end

  def test_should_destroy_would_you_prefer
    login_as :admin
    
    assert_difference('WouldYouPrefer.count', -1) do
      delete :destroy, :id => would_you_prefers(:one).id
    end

    assert_redirected_to would_you_prefers_path
  end
  
  def test_show_should_increase_number_of_views
    w = WouldYouPrefer.find(:first)
    assert_difference 'w.viewed' do
      get :show, :id => w.id
      w.reload
    end
  end
    
  protected
  def superclassica
    {:first_option => 'prenderlo in culo', :second_option => 'fare una pompa'}
  end
end
