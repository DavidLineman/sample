require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup 
    @user = users(:david)
    @other_user = users(:marvin)
  end

  test "should get new" do
    get signup_path
    assert_response :success
  end

  test "should get redirect edit when not loggd in" do 
    get edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when lot logged in" do
    patch user_path(@user), params: { user: { name: @user.name,
                                              email: @user.email } }
    assert_not flash.empty?
    assert_redirected_to login_url
  end
 
end
