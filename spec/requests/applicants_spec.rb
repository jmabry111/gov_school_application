require 'spec_helper'

describe "Applicants" do
  
  subject {page}
 
  describe "New Applicant Form" do
    it "should have the content 'Enter applicant information'" do
      visit '/applicants/new'
      page.should have_content('Enter applicant information')
    end
  end  
  
  describe "submit application" do
    before {visit applicant1_path}
    let(:submit) {"Submit my information"}
    
    describe "with invalid information" do
      it "should not submit information" do
        expect {click_button submit}.not_to change(Applicant, :count)
      end
    end
    
  end
  
end
