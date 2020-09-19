require 'spec_helper'

feature 'coordinator_edits' do
  scenario 'without_errors' do
    user = FactoryBot.create(:user)
    user_designation = FactoryBot.create(:user_designation)
  end
end
