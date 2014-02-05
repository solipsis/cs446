require 'test_helper'

class PetSelectorsControllerTest < ActionController::TestCase
  setup do
    @pet_selector = pet_selectors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pet_selectors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pet_selector" do
    assert_difference('PetSelector.count') do
      post :create, pet_selector: {  }
    end

    assert_redirected_to pet_selector_path(assigns(:pet_selector))
  end

  test "should show pet_selector" do
    get :show, id: @pet_selector
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pet_selector
    assert_response :success
  end

  test "should update pet_selector" do
    patch :update, id: @pet_selector, pet_selector: {  }
    assert_redirected_to pet_selector_path(assigns(:pet_selector))
  end

  test "should destroy pet_selector" do
    assert_difference('PetSelector.count', -1) do
      delete :destroy, id: @pet_selector
    end

    assert_redirected_to pet_selectors_path
  end
end
