require 'test_helper'

class GeneratorControllerTest < ActionController::TestCase
  test "should get input" do
    get :input
    assert_response :success
  end

end
