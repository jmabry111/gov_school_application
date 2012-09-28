require 'spec_helper'

describe School do
  before { @school = School.new(name: "Example High School", representative_email: "counselor@example.com") }
  
  subject { @school }
  
  it { should respond_to(:name) }
  it { should respond_to(:representative_email) }
  
  it { should be_valid }
  describe "when school is not present" do
  before { @school.name = " " }
    it { should_not be_valid }
  end
  describe "when schoolname is too long" do
  before { @school.name = "a"*51 }
    it { should_not be_valid }
  end
  
  
  describe "when rep_email is not present" do
  before { @school.representative_email = " " }
    it { should_not be_valid }
  end
end
