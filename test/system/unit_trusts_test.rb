require "application_system_test_case"

class UnitTrustsTest < ApplicationSystemTestCase
  setup do
    @unit_trust = unit_trusts(:one)
  end

  test "visiting the index" do
    visit unit_trusts_url
    assert_selector "h1", text: "Unit Trusts"
  end

  test "creating a Unit trust" do
    visit unit_trusts_url
    click_on "New Unit Trust"

    fill_in "Name", with: @unit_trust.name
    click_on "Create Unit trust"

    assert_text "Unit trust was successfully created"
    click_on "Back"
  end

  test "updating a Unit trust" do
    visit unit_trusts_url
    click_on "Edit", match: :first

    fill_in "Name", with: @unit_trust.name
    click_on "Update Unit trust"

    assert_text "Unit trust was successfully updated"
    click_on "Back"
  end

  test "destroying a Unit trust" do
    visit unit_trusts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Unit trust was successfully destroyed"
  end
end
