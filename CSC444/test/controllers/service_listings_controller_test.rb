require 'test_helper'

class ServiceListingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get service_listings_index_url
    assert_response :success
  end

  test "should get new" do
    get service_listings_new_url
    assert_response :success
  end

end
