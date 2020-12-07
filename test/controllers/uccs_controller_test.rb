require 'test_helper'

class UccsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ucc = uccs(:one)
  end

  test "should get index" do
    get uccs_url
    assert_response :success
  end

  test "should get new" do
    get new_ucc_url
    assert_response :success
  end

  test "should create ucc" do
    assert_difference('Ucc.count') do
      post uccs_url, params: { ucc: {  } }
    end

    assert_redirected_to ucc_url(Ucc.last)
  end

  test "should show ucc" do
    get ucc_url(@ucc)
    assert_response :success
  end

  test "should get edit" do
    get edit_ucc_url(@ucc)
    assert_response :success
  end

  test "should update ucc" do
    patch ucc_url(@ucc), params: { ucc: {  } }
    assert_redirected_to ucc_url(@ucc)
  end

  test "should destroy ucc" do
    assert_difference('Ucc.count', -1) do
      delete ucc_url(@ucc)
    end

    assert_redirected_to uccs_url
  end
end
