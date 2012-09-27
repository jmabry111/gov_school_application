require 'spec_helper'

describe "SchoolPages" do
  
  subject { page }
  
  describe "new school page" do
    before { visit new_school_path }
    
    it { should have_selector('h1', text: 'Enter school') }
  end
end
