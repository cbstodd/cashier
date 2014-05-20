require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_select '.col-xs-6', minimum: 3
    assert_select '.col-md-3', minimum: 3
    assert_select 'h1', "Buzzy's Main menu"
    assert_select '.price', /\$[,\d]+\.\d\d/
  end

end
