require 'test_helper'

class ConsiderationItemsControllerTest < ActionController::TestCase
  setup do
    @consideration_item = consideration_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:consideration_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create consideration_item" do
    assert_difference('ConsiderationItem.count') do
      post :create, consideration_item: { consideration_list_id: @consideration_item.consideration_list_id, pet_id: @consideration_item.pet_id }
    end

    assert_redirected_to consideration_item_path(assigns(:consideration_item))
  end

  test "should show consideration_item" do
    get :show, id: @consideration_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @consideration_item
    assert_response :success
  end

  test "should update consideration_item" do
    patch :update, id: @consideration_item, consideration_item: { consideration_list_id: @consideration_item.consideration_list_id, pet_id: @consideration_item.pet_id }
    assert_redirected_to consideration_item_path(assigns(:consideration_item))
  end

  test "should destroy consideration_item" do
    assert_difference('ConsiderationItem.count', -1) do
      delete :destroy, id: @consideration_item
    end

    assert_redirected_to consideration_items_path
  end
end
