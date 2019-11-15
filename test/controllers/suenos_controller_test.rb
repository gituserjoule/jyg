require 'test_helper'

class SuenosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
