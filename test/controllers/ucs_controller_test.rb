require 'test_helper'

class UcsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @uc = ucs(:one)
  end

  test "should get index" do
    get ucs_url
    assert_response :success
  end

  test "should get new" do
    get new_uc_url
    assert_response :success
  end

  test "should create uc" do
    assert_difference('Uc.count') do
      post ucs_url, params: { uc: { carabineros_id: @uc.carabineros_id, user_id: @uc.user_id } }
    end

    assert_redirected_to uc_url(Uc.last)
  end

  test "should show uc" do
    get uc_url(@uc)
    assert_response :success
  end

  test "should get edit" do
    get edit_uc_url(@uc)
    assert_response :success
  end

  test "should update uc" do
    patch uc_url(@uc), params: { uc: { carabineros_id: @uc.carabineros_id, user_id: @uc.user_id } }
    assert_redirected_to uc_url(@uc)
  end

  test "should destroy uc" do
    assert_difference('Uc.count', -1) do
      delete uc_url(@uc)
    end

    assert_redirected_to ucs_url
  end
end
