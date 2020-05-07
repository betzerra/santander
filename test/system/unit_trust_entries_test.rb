require "application_system_test_case"

class UnitTrustEntriesTest < ApplicationSystemTestCase
  setup do
    @unit_trust_entry = unit_trust_entries(:one)
  end

  test "visiting the index" do
    visit unit_trust_entries_url
    assert_selector "h1", text: "Unit Trust Entries"
  end

  test "creating a Unit trust entry" do
    visit unit_trust_entries_url
    click_on "New Unit Trust Entry"

    fill_in "Date", with: @unit_trust_entry.date
    fill_in "Last 12 months", with: @unit_trust_entry.last_12_months
    fill_in "Last 30 days", with: @unit_trust_entry.last_30_days
    fill_in "Last 90 days", with: @unit_trust_entry.last_90_days
    fill_in "Last day", with: @unit_trust_entry.last_day
    fill_in "Unit trust", with: @unit_trust_entry.unit_trust_id
    fill_in "Value", with: @unit_trust_entry.value
    click_on "Create Unit trust entry"

    assert_text "Unit trust entry was successfully created"
    click_on "Back"
  end

  test "updating a Unit trust entry" do
    visit unit_trust_entries_url
    click_on "Edit", match: :first

    fill_in "Date", with: @unit_trust_entry.date
    fill_in "Last 12 months", with: @unit_trust_entry.last_12_months
    fill_in "Last 30 days", with: @unit_trust_entry.last_30_days
    fill_in "Last 90 days", with: @unit_trust_entry.last_90_days
    fill_in "Last day", with: @unit_trust_entry.last_day
    fill_in "Unit trust", with: @unit_trust_entry.unit_trust_id
    fill_in "Value", with: @unit_trust_entry.value
    click_on "Update Unit trust entry"

    assert_text "Unit trust entry was successfully updated"
    click_on "Back"
  end

  test "destroying a Unit trust entry" do
    visit unit_trust_entries_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Unit trust entry was successfully destroyed"
  end
end
