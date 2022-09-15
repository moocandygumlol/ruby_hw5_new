require "test_helper"

class MainControllerTest < ActionDispatch::IntegrationTest
  test "should get hone" do
    get main_hone_url
    assert_response :success
  end

  test "should get test" do
    get main_test_url
    assert_response :success
  end

  test "should get out" do
    get main_out_url
    assert_response :success
  end
end
