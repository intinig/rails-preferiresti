require File.dirname(__FILE__) + '/../test_helper'
#require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  include AuthenticatedTestHelper
  
  fixtures :all
  
  def test_should_get_index
    get :index, :would_you_prefer_id => would_you_prefers(:would_you_prefer_one).id
    assert_response :success
    assert_not_nil assigns(:comments)
  end

  def test_should_get_new
    get :new, :would_you_prefer_id => would_you_prefers(:would_you_prefer_one).id
    assert_response :success
  end
  
  def test_should_create_comment
    assert_difference('Comment.count') do
      post :create, :would_you_prefer_id => would_you_prefers(:would_you_prefer_one).id, :comment => { :body => "hello I'm a viagra spammer" }
    end
  
    assert_redirected_to comment_path(assigns(:comment))
  end
  
  def test_should_show_comment
    get :show, :would_you_prefer_id => would_you_prefers(:would_you_prefer_one).id, :id => comments(:comment_one).id
    assert_response :success
  end
  
  def test_should_get_edit
    login_as :admin
    
    get :edit, :would_you_prefer_id => would_you_prefers(:would_you_prefer_one).id, :id => comments(:comment_one).id
    assert_response :success
  end
  
  def test_edit_should_redirect_unless_admin
    login_as :quentin    
    get :edit, :would_you_prefer_id => would_you_prefers(:would_you_prefer_one).id, :id => comments(:comment_one).id
    assert_redirected_to new_session_path
  end
  
  def test_should_update_comment
    login_as :admin
    put :update, :would_you_prefer_id => would_you_prefers(:would_you_prefer_one).id, :id => comments(:comment_one).id, :comment => { :body => 'ok' }
    assert_redirected_to comment_path(assigns(:comment))
  end
  
  def test_update_should_redirect_unless_admin
    login_as :quentin
    put :update, :would_you_prefer_id => would_you_prefers(:would_you_prefer_one).id, :id => comments(:comment_one).id, :comment => { :body => 'ok' }
    assert_redirected_to new_session_path
  end
  
  def test_should_destroy_comment
    login_as :admin
    assert_difference('Comment.count', -1) do
      delete :destroy, :would_you_prefer_id => would_you_prefers(:would_you_prefer_one).id, :id => comments(:comment_one).id
    end
  
    assert_redirected_to comments_path
  end
  
  def test_delete_should_redirect_unless_admin
    login_as :quentin
    assert_no_difference('Comment.count') do
      delete :destroy, :would_you_prefer_id => would_you_prefers(:would_you_prefer_one).id, :id => comments(:comment_one).id
    end
  
    assert_redirected_to new_session_path
  end
  
end
