require 'test_helper'

class CarabinerosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @carabinero = carabineros(:one)
  end

  test "should get index" do
    get carabineros_url
    assert_response :success
  end

  test "should get new" do
    get new_carabinero_url
    assert_response :success
  end

  test "should create carabinero" do
    assert_difference('Carabinero.count') do
      post carabineros_url, params: { carabinero: { address: @carabinero.address, email: @carabinero.email, name: @carabinero.name, phone: @carabinero.phone } }
    end

    assert_redirected_to carabinero_url(Carabinero.last)
  end

  test "should show carabinero" do
    get carabinero_url(@carabinero)
    assert_response :success
  end

  test "should get edit" do
    get edit_carabinero_url(@carabinero)
    assert_response :success
  end

  test "should update carabinero" do
    patch carabinero_url(@carabinero), params: { carabinero: { address: @carabinero.address, email: @carabinero.email, name: @carabinero.name, phone: @carabinero.phone } }
    assert_redirected_to carabinero_url(@carabinero)
  end

  test "should destroy carabinero" do
    assert_difference('Carabinero.count', -1) do
      delete carabinero_url(@carabinero)
    end

    assert_redirected_to carabineros_url
  end
end
