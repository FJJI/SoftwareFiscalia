require "application_system_test_case"

class UcsTest < ApplicationSystemTestCase
  setup do
    @uc = ucs(:one)
  end

  test "visiting the index" do
    visit ucs_url
    assert_selector "h1", text: "Ucs"
  end

  test "creating a Uc" do
    visit ucs_url
    click_on "New Uc"

    fill_in "Carabineros", with: @uc.carabineros_id
    fill_in "User", with: @uc.user_id
    click_on "Create Uc"

    assert_text "Uc was successfully created"
    click_on "Back"
  end

  test "updating a Uc" do
    visit ucs_url
    click_on "Edit", match: :first

    fill_in "Carabineros", with: @uc.carabineros_id
    fill_in "User", with: @uc.user_id
    click_on "Update Uc"

    assert_text "Uc was successfully updated"
    click_on "Back"
  end

  test "destroying a Uc" do
    visit ucs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Uc was successfully destroyed"
  end
end
