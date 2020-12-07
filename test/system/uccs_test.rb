require "application_system_test_case"

class UccsTest < ApplicationSystemTestCase
  setup do
    @ucc = uccs(:one)
  end

  test "visiting the index" do
    visit uccs_url
    assert_selector "h1", text: "Uccs"
  end

  test "creating a Ucc" do
    visit uccs_url
    click_on "New Ucc"

    click_on "Create Ucc"

    assert_text "Ucc was successfully created"
    click_on "Back"
  end

  test "updating a Ucc" do
    visit uccs_url
    click_on "Edit", match: :first

    click_on "Update Ucc"

    assert_text "Ucc was successfully updated"
    click_on "Back"
  end

  test "destroying a Ucc" do
    visit uccs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ucc was successfully destroyed"
  end
end
