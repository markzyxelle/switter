require 'test_helper'

class StatusControllerTest < ActionController::TestCase
  test "should get toggle" do
    get :toggle
    assert_response :success
  end

end
