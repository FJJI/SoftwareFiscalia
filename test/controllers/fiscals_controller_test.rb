require 'test_helper'

class FiscalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fiscal = fiscals(:one)
  end

  test "should get index" do
    get fiscals_url
    assert_response :success
  end

  test "should get new" do
    get new_fiscal_url
    assert_response :success
  end

  test "should create fiscal" do
    assert_difference('Fiscal.count') do
      post fiscals_url, params: { fiscal: { address: @fiscal.address, email: @fiscal.email, name: @fiscal.name, phone: @fiscal.phone } }
    end

    assert_redirected_to fiscal_url(Fiscal.last)
  end

  test "should show fiscal" do
    get fiscal_url(@fiscal)
    assert_response :success
  end

  test "should get edit" do
    get edit_fiscal_url(@fiscal)
    assert_response :success
  end

  test "should update fiscal" do
    patch fiscal_url(@fiscal), params: { fiscal: { address: @fiscal.address, email: @fiscal.email, name: @fiscal.name, phone: @fiscal.phone } }
    assert_redirected_to fiscal_url(@fiscal)
  end

  test "should destroy fiscal" do
    assert_difference('Fiscal.count', -1) do
      delete fiscal_url(@fiscal)
    end

    assert_redirected_to fiscals_url
  end
end
