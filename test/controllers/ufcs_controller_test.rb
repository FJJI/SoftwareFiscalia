require 'test_helper'

class UfcsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ufc = ufcs(:one)
  end

  test "should get index" do
    get ufcs_url
    assert_response :success
  end

  test "should get new" do
    get new_ufc_url
    assert_response :success
  end

  test "should create ufc" do
    assert_difference('Ufc.count') do
      post ufcs_url, params: { ufc: {  } }
    end

    assert_redirected_to ufc_url(Ufc.last)
  end

  test "should show ufc" do
    get ufc_url(@ufc)
    assert_response :success
  end

  test "should get edit" do
    get edit_ufc_url(@ufc)
    assert_response :success
  end

  test "should update ufc" do
    patch ufc_url(@ufc), params: { ufc: {  } }
    assert_redirected_to ufc_url(@ufc)
  end

  test "should destroy ufc" do
    assert_difference('Ufc.count', -1) do
      delete ufc_url(@ufc)
    end

    assert_redirected_to ufcs_url
  end
end
