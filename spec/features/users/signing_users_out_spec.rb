require 'rails_helper'

RSpec.feature 'Signing users out' do
  before do
     @john = User.create!(first_name: "John", last_name: "Doe", email: "john@example.com",
                         password: "password")

    visit '/'

    click_link 'Sign in'

    fill_in 'Email', with: @john.email
    fill_in 'Password', with: @john.password

    click_button 'Log in'
  end

  scenario 'sign out' do
    visit '/'

    click_link 'Sign out'

    expect(page).to have_content('Signed out successfully.')
    expect(page).to have_link('Sign in')
    expect(page).to have_link('Sign up')
    expect(page).not_to have_link('Sign out')
  end
end
