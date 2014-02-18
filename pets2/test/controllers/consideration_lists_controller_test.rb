require 'test_helper'

class ConsiderationListsControllerTest < ActionController::TestCase
  setup do
    @consideration_list = consideration_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:consideration_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create consideration_list" do
    assert_difference('ConsiderationList.count') do
      post :create, consideration_list: {  }
    end

    assert_redirected_to consideration_list_path(assigns(:consideration_list))
  end

  test "should show consideration_list" do
    get :show, id: @consideration_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @consideration_list
    assert_response :success
  end

  test "should update consideration_list" do
    patch :update, id: @consideration_list, consideration_list: {  }
    assert_redirected_to consideration_list_path(assigns(:consideration_list))
  end

  test "should destroy consideration_list" do
    assert_difference('ConsiderationList.count', -1) do
      delete :destroy, id: @consideration_list
    end

    assert_redirected_to consideration_lists_path
  end
end
