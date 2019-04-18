require 'test_helper'

class CodesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get codes_new_url
    assert_response :success
  end

  test "should get create" do
    get codes_create_url
    assert_response :success
  end

end
