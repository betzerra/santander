require 'test_helper'

class UnitTrustEntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @unit_trust_entry = unit_trust_entries(:one)
  end

  test "should get index" do
    get unit_trust_entries_url
    assert_response :success
  end

  test "should get new" do
    get new_unit_trust_entry_url
    assert_response :success
  end

  test "should create unit_trust_entry" do
    assert_difference('UnitTrustEntry.count') do
      post unit_trust_entries_url, params: { unit_trust_entry: { date: @unit_trust_entry.date, last_12_months: @unit_trust_entry.last_12_months, last_30_days: @unit_trust_entry.last_30_days, last_90_days: @unit_trust_entry.last_90_days, last_day: @unit_trust_entry.last_day, unit_trust_id: @unit_trust_entry.unit_trust_id, value: @unit_trust_entry.value } }
    end

    assert_redirected_to unit_trust_entry_url(UnitTrustEntry.last)
  end

  test "should show unit_trust_entry" do
    get unit_trust_entry_url(@unit_trust_entry)
    assert_response :success
  end

  test "should get edit" do
    get edit_unit_trust_entry_url(@unit_trust_entry)
    assert_response :success
  end

  test "should update unit_trust_entry" do
    patch unit_trust_entry_url(@unit_trust_entry), params: { unit_trust_entry: { date: @unit_trust_entry.date, last_12_months: @unit_trust_entry.last_12_months, last_30_days: @unit_trust_entry.last_30_days, last_90_days: @unit_trust_entry.last_90_days, last_day: @unit_trust_entry.last_day, unit_trust_id: @unit_trust_entry.unit_trust_id, value: @unit_trust_entry.value } }
    assert_redirected_to unit_trust_entry_url(@unit_trust_entry)
  end

  test "should destroy unit_trust_entry" do
    assert_difference('UnitTrustEntry.count', -1) do
      delete unit_trust_entry_url(@unit_trust_entry)
    end

    assert_redirected_to unit_trust_entries_url
  end
end
