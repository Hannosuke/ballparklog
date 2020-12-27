require 'test_helper'

class BallparkLogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ballpark_log = ballpark_logs(:one)
  end

  test "should get index" do
    get ballpark_logs_url
    assert_response :success
  end

  test "should get new" do
    get new_ballpark_log_url
    assert_response :success
  end

  test "should create ballpark_log" do
    assert_difference('BallparkLog.count') do
      post ballpark_logs_url, params: { ballpark_log: { description: @ballpark_log.description, title: @ballpark_log.title } }
    end

    assert_redirected_to ballpark_log_url(BallparkLog.last)
  end

  test "should show ballpark_log" do
    get ballpark_log_url(@ballpark_log)
    assert_response :success
  end

  test "should get edit" do
    get edit_ballpark_log_url(@ballpark_log)
    assert_response :success
  end

  test "should update ballpark_log" do
    patch ballpark_log_url(@ballpark_log), params: { ballpark_log: { description: @ballpark_log.description, title: @ballpark_log.title } }
    assert_redirected_to ballpark_log_url(@ballpark_log)
  end

  test "should destroy ballpark_log" do
    assert_difference('BallparkLog.count', -1) do
      delete ballpark_log_url(@ballpark_log)
    end

    assert_redirected_to ballpark_logs_url
  end
end
