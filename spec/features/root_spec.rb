require 'spec_helper'

feature 'Home page' do
  scenario 'loading home page with logo brand', js: true do
    visit root_path
    page.should have_content('PaySlip App')
  end
end


