require 'test_helper'

class OnlineDonationControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get signup" do
    get :signup
    assert_response :success
  end

  test "should get donate" do
    get :donate
    assert_response :success
  end

  test "should get createEvent" do
    get :createEvent
    assert_response :success
  end

end
