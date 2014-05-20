require 'test_helper'

class EntreesControllerTest < ActionController::TestCase
  setup do
    @entree = entrees(:menu)
    @update = {
      food_item: "Lorem Ipsum",
      description: "Ipsum loreum",
      image_url: "example.jpg",
      price: 12.99
    }
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:entrees)
    assert_select ".col-xs-6", minumum: 1
    assert_select ".col-md-3", minimum: 1
    assert_select "h1", "Main menu"
    assert_select ".price", /\$[,\d]+\.\d\d/
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create entree" do
    assert_difference('Entree.count') do
      post :create, entree: @update
    end

    assert_redirected_to entree_path(assigns(:entree))
  end

  test "should show entree" do
    get :show, id: @entree
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @entree
    assert_response :success
  end

  test "should update entree" do
    patch :update, id: @entree, entree: @update
    assert_redirected_to entree_path(assigns(:entree))
  end

  test "should destroy entree" do
    assert_difference('Entree.count', -1) do
      delete :destroy, id: @entree
    end

    assert_redirected_to entrees_path
  end


end
