require 'spec_helper'

describe "application" do
  it "allows users to get to the application" do
    visit root_path
    click_link "Begin Application Process"
    page.should have_content "Mission Statement"
    click_link"Continue"
    page.should have_content "How to apply"
    click_link "Continue"
    page.should have_content "Application Process"
    click_link "Begin Application"
    page.should have_content "Enter applicant information"
  end

  context "given correct information" do
    it "shows a confirmation" do
      visit new_applicant_path
      fill_in_required_information("spiderman@example.com")
      click_button "Submit my information"

      page.should have_content("Message was successfully sent")
    end

    it "creates a new applicant" do
      visit new_applicant_path
      fill_in_required_information("spiderman@example.com")
      click_button "Submit my information"

      Applicant.count.should eq 1
    end

    it "sends an email to the adminstrators" do
      visit new_applicant_path
      fill_in_required_information("spiderman@example.com")
      click_button "Submit my information"

      sent_email = last_email
      last_email.to.should include "jmabry@mymabry.com"
      last_email.subject.should eq "Submitted Application"
    end
  end

  context "missing required information" do
    it "will show that the form has errors" do
      visit new_applicant_path
      click_button "Submit my information"

      page.should have_content("The form contains")
      page.should have_content("errors")
      Applicant.count.should eq 0
    end
  end

  def fill_in_required_information(email)
    select("Bassett High School", from: "School")
    fill_in("First Name", with: "Peter")
    fill_in("Last Name", with: "Parker")
    choose("11")
    fill_in("Parent/Guardian First Name", with: "Aunt")
    fill_in("Parent/Guardian Last Name", with: "Mae")
    fill_in("Home Phone", with: "222-222-2222")
    fill_in("Work Phone", with: "111-111-1111")
    fill_in("Email", with: email)
    fill_in("Math", with: "Mrs Smith")
    fill_in("Science", with: "Doc Oc")
    fill_in("English", with: "Another One")
  end
end
