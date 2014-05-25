require 'spec_helper'

feature 'User functions' do
  scenario 'allows a user to register' do
    visit '/'
    click_on 'Register Here!'
    fill_in 'First Name', with: 'Bob'
    fill_in 'Last Name', with: 'Robert'
    fill_in 'Email', with: 'BobRobert@bob.com'
    fill_in 'Password', with: 'bob'
    fill_in 'Password Confirmation', with: 'bob'
    check 'terms'
    click_on 'Submit'
    
    expect(page).to have_content 'Welcome, Bob!'
  end
  
  scenario 'allows a user to sign in' do
    visit '/'
    click_on 'Register Here!'
    fill_in 'First Name', with: 'Bob'
    fill_in 'Last Name', with: 'Robert'
    fill_in 'Email', with: 'BobRobert@bob.com'
    fill_in 'Password', with: 'bob'
    fill_in 'Password Confirmation', with: 'bob'
    check 'terms'
    click_on 'Submit'

    expect(page).to have_content 'Welcome, Bob!'
    click_on 'Sign Out'
    
    click_on 'Sign In'
    fill_in 'Email', with: 'BobRober@bob.com'
    fill_in 'Password', with: 'bob'
    click_on 'Submit'
  end
end