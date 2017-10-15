require 'test_helper'

class TeensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @teen = teens(:one)
  end

  test "should get index" do
    get teens_url
    assert_response :success
  end

  test "should get new" do
    get new_teen_url
    assert_response :success
  end

  test "should create teen" do
    assert_difference('Teen.count') do
      post teens_url, params: { teen: {  } }
    end

    assert_redirected_to teen_url(Teen.last)
  end

  test "should show teen" do
    get teen_url(@teen)
    assert_response :success
  end

  test "should get edit" do
    get edit_teen_url(@teen)
    assert_response :success
  end

  test "should update teen" do
    patch teen_url(@teen), params: { teen: {  } }
    assert_redirected_to teen_url(@teen)
  end

  test "should destroy teen" do
    assert_difference('Teen.count', -1) do
      delete teen_url(@teen)
    end

    assert_redirected_to teens_url
  end
end
