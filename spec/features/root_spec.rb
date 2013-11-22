require 'spec_helper'

feature 'Home page' do
  scenario 'loading home page with logo brand', js: true do
    visit '/'
    expect(page).to have_content 'PaySlip App'
  end
end


