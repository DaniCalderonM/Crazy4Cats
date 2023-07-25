require "application_system_test_case"

class CfcpostsTest < ApplicationSystemTestCase
  setup do
    @cfcpost = cfcposts(:one)
  end

  test "visiting the index" do
    visit cfcposts_url
    assert_selector "h1", text: "Cfcposts"
  end

  test "should create cfcpost" do
    visit cfcposts_url
    click_on "New cfcpost"

    fill_in "Cfcuser", with: @cfcpost.cfcuser_id
    fill_in "Description", with: @cfcpost.description
    fill_in "Image", with: @cfcpost.image
    click_on "Create Cfcpost"

    assert_text "Cfcpost was successfully created"
    click_on "Back"
  end

  test "should update Cfcpost" do
    visit cfcpost_url(@cfcpost)
    click_on "Edit this cfcpost", match: :first

    fill_in "Cfcuser", with: @cfcpost.cfcuser_id
    fill_in "Description", with: @cfcpost.description
    fill_in "Image", with: @cfcpost.image
    click_on "Update Cfcpost"

    assert_text "Cfcpost was successfully updated"
    click_on "Back"
  end

  test "should destroy Cfcpost" do
    visit cfcpost_url(@cfcpost)
    click_on "Destroy this cfcpost", match: :first

    assert_text "Cfcpost was successfully destroyed"
  end
end
