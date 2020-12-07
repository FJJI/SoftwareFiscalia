require "application_system_test_case"

class UfcsTest < ApplicationSystemTestCase
  setup do
    @ufc = ufcs(:one)
  end

  test "visiting the index" do
    visit ufcs_url
    assert_selector "h1", text: "Ufcs"
  end

  test "creating a Ufc" do
    visit ufcs_url
    click_on "New Ufc"

    click_on "Create Ufc"

    assert_text "Ufc was successfully created"
    click_on "Back"
  end

  test "updating a Ufc" do
    visit ufcs_url
    click_on "Edit", match: :first

    click_on "Update Ufc"

    assert_text "Ufc was successfully updated"
    click_on "Back"
  end

  test "destroying a Ufc" do
    visit ufcs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ufc was successfully destroyed"
  end
end
