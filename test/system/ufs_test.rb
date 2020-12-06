require "application_system_test_case"

class UfsTest < ApplicationSystemTestCase
  setup do
    @uf = ufs(:one)
  end

  test "visiting the index" do
    visit ufs_url
    assert_selector "h1", text: "Ufs"
  end

  test "creating a Uf" do
    visit ufs_url
    click_on "New Uf"

    click_on "Create Uf"

    assert_text "Uf was successfully created"
    click_on "Back"
  end

  test "updating a Uf" do
    visit ufs_url
    click_on "Edit", match: :first

    click_on "Update Uf"

    assert_text "Uf was successfully updated"
    click_on "Back"
  end

  test "destroying a Uf" do
    visit ufs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Uf was successfully destroyed"
  end
end
