require 'spec_helper'

feature 'coordinator_edits' do
  scenario 'without_errors' do
    user = FactoryGirl.create(:user)
    user_designation = FactoryGirl.create(:user_designation)
  end
end
