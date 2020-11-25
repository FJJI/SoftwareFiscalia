require "application_system_test_case"

class FiscalsTest < ApplicationSystemTestCase
  setup do
    @fiscal = fiscals(:one)
  end

  test "visiting the index" do
    visit fiscals_url
    assert_selector "h1", text: "Fiscals"
  end

  test "creating a Fiscal" do
    visit fiscals_url
    click_on "New Fiscal"

    fill_in "Address", with: @fiscal.address
    fill_in "Email", with: @fiscal.email
    fill_in "Name", with: @fiscal.name
    fill_in "Phone", with: @fiscal.phone
    click_on "Create Fiscal"

    assert_text "Fiscal was successfully created"
    click_on "Back"
  end

  test "updating a Fiscal" do
    visit fiscals_url
    click_on "Edit", match: :first

    fill_in "Address", with: @fiscal.address
    fill_in "Email", with: @fiscal.email
    fill_in "Name", with: @fiscal.name
    fill_in "Phone", with: @fiscal.phone
    click_on "Update Fiscal"

    assert_text "Fiscal was successfully updated"
    click_on "Back"
  end

  test "destroying a Fiscal" do
    visit fiscals_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Fiscal was successfully destroyed"
  end
end
