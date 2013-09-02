require 'test_helper'

class QuoteControllerTest < ActionController::TestCase
  test "should get quoteInput" do
    get :quoteInput
    assert_response :success
  end

end
