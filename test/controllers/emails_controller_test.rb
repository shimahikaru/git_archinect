require 'test_helper'

class EmailsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get emails_index_url
    assert_response :success
  end

  test "should get confirm" do
    get emails_confirm_url
    assert_response :success
  end

  test "should get complete" do
    get emails_complete_url
    assert_response :success
  end

end
