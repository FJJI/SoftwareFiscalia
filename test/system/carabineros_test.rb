require "application_system_test_case"

class CarabinerosTest < ApplicationSystemTestCase
  setup do
    @carabinero = carabineros(:one)
  end

  test "visiting the index" do
    visit carabineros_url
    assert_selector "h1", text: "Carabineros"
  end

  test "creating a Carabinero" do
    visit carabineros_url
    click_on "New Carabinero"

    fill_in "Address", with: @carabinero.address
    fill_in "Email", with: @carabinero.email
    fill_in "Name", with: @carabinero.name
    fill_in "Phone", with: @carabinero.phone
    click_on "Create Carabinero"

    assert_text "Carabinero was successfully created"
    click_on "Back"
  end

  test "updating a Carabinero" do
    visit carabineros_url
    click_on "Edit", match: :first

    fill_in "Address", with: @carabinero.address
    fill_in "Email", with: @carabinero.email
    fill_in "Name", with: @carabinero.name
    fill_in "Phone", with: @carabinero.phone
    click_on "Update Carabinero"

    assert_text "Carabinero was successfully updated"
    click_on "Back"
  end

  test "destroying a Carabinero" do
    visit carabineros_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Carabinero was successfully destroyed"
  end
end
