require 'test_helper'

class FosterAgreementsControllerTest < ActionController::TestCase
  setup do
    @foster_agreement = foster_agreements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:foster_agreements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create foster_agreement" do
    assert_difference('FosterAgreement.count') do
      post :create, foster_agreement: { pet_id: @foster_agreement.pet_id }
    end

    assert_redirected_to foster_agreement_path(assigns(:foster_agreement))
  end

  test "should show foster_agreement" do
    get :show, id: @foster_agreement
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @foster_agreement
    assert_response :success
  end

  test "should update foster_agreement" do
    patch :update, id: @foster_agreement, foster_agreement: { pet_id: @foster_agreement.pet_id }
    assert_redirected_to foster_agreement_path(assigns(:foster_agreement))
  end

  test "should destroy foster_agreement" do
    assert_difference('FosterAgreement.count', -1) do
      delete :destroy, id: @foster_agreement
    end

    assert_redirected_to foster_agreements_path
  end
end
