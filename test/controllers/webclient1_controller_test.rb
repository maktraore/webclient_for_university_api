require 'test_helper'

class Webclient1ControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get webclient1_index_url
    assert_response :success
  end

end
