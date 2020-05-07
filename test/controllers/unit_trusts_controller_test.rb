require 'test_helper'

class UnitTrustsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @unit_trust = unit_trusts(:one)
  end

  test "should get index" do
    get unit_trusts_url
    assert_response :success
  end

  test "should get new" do
    get new_unit_trust_url
    assert_response :success
  end

  test "should create unit_trust" do
    assert_difference('UnitTrust.count') do
      post unit_trusts_url, params: { unit_trust: { name: @unit_trust.name } }
    end

    assert_redirected_to unit_trust_url(UnitTrust.last)
  end

  test "should show unit_trust" do
    get unit_trust_url(@unit_trust)
    assert_response :success
  end

  test "should get edit" do
    get edit_unit_trust_url(@unit_trust)
    assert_response :success
  end

  test "should update unit_trust" do
    patch unit_trust_url(@unit_trust), params: { unit_trust: { name: @unit_trust.name } }
    assert_redirected_to unit_trust_url(@unit_trust)
  end

  test "should destroy unit_trust" do
    assert_difference('UnitTrust.count', -1) do
      delete unit_trust_url(@unit_trust)
    end

    assert_redirected_to unit_trusts_url
  end
end
