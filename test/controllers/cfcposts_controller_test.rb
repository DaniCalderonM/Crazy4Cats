require "test_helper"

class CfcpostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cfcpost = cfcposts(:one)
  end

  test "should get index" do
    get cfcposts_url
    assert_response :success
  end

  test "should get new" do
    get new_cfcpost_url
    assert_response :success
  end

  test "should create cfcpost" do
    assert_difference("Cfcpost.count") do
      post cfcposts_url, params: { cfcpost: { cfcuser_id: @cfcpost.cfcuser_id, description: @cfcpost.description, image: @cfcpost.image } }
    end

    assert_redirected_to cfcpost_url(Cfcpost.last)
  end

  test "should show cfcpost" do
    get cfcpost_url(@cfcpost)
    assert_response :success
  end

  test "should get edit" do
    get edit_cfcpost_url(@cfcpost)
    assert_response :success
  end

  test "should update cfcpost" do
    patch cfcpost_url(@cfcpost), params: { cfcpost: { cfcuser_id: @cfcpost.cfcuser_id, description: @cfcpost.description, image: @cfcpost.image } }
    assert_redirected_to cfcpost_url(@cfcpost)
  end

  test "should destroy cfcpost" do
    assert_difference("Cfcpost.count", -1) do
      delete cfcpost_url(@cfcpost)
    end

    assert_redirected_to cfcposts_url
  end
end
