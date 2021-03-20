require 'test_helper'

class LearnsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get learns_index_url
    assert_response :success
  end

end
