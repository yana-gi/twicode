require "application_system_test_case"

class CodeTest < ApplicationSystemTestCase
  setup do
    @code = code(:one)
  end

  test "visiting the index" do
    visit code_url
    assert_selector "h1", text: "Code"
  end

  test "creating a Code" do
    visit code_url
    click_on "New Code"

    fill_in "Body", with: @code.body
    click_on "Create Code"

    assert_text "Code was successfully created"
    click_on "Back"
  end

  test "updating a Code" do
    visit code_url
    click_on "Edit", match: :first

    fill_in "Body", with: @code.body
    click_on "Update Code"

    assert_text "Code was successfully updated"
    click_on "Back"
  end

  test "destroying a Code" do
    visit code_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Code was successfully destroyed"
  end
end
