require "application_system_test_case"

class BallparkLogsTest < ApplicationSystemTestCase
  setup do
    @ballpark_log = ballpark_logs(:one)
  end

  test "visiting the index" do
    visit ballpark_logs_url
    assert_selector "h1", text: "Ballpark Logs"
  end

  test "creating a Ballpark log" do
    visit ballpark_logs_url
    click_on "New Ballpark Log"

    fill_in "Description", with: @ballpark_log.description
    fill_in "Title", with: @ballpark_log.title
    click_on "Create Ballpark log"

    assert_text "Ballpark log was successfully created"
    click_on "Back"
  end

  test "updating a Ballpark log" do
    visit ballpark_logs_url
    click_on "Edit", match: :first

    fill_in "Description", with: @ballpark_log.description
    fill_in "Title", with: @ballpark_log.title
    click_on "Update Ballpark log"

    assert_text "Ballpark log was successfully updated"
    click_on "Back"
  end

  test "destroying a Ballpark log" do
    visit ballpark_logs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ballpark log was successfully destroyed"
  end
end
