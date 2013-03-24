require 'test_helper'

class AccelDatasControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get datas" do
    get :datas
    assert_response :success
  end

end
