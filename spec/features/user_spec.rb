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
  
  scenario 'user can see a page about the pronunciation' do
    visit '/'
    click_on 'JIF? NO.'
    expect(page).to have_content 'Al Gore'
  end
end

feature 'Gif functions' do
  scenario 'allows a user to upload a gif' do
    visit '/'
    
    click_on 'Add a Gif!'
    fill_in 'Gif Url', with: 'https://media.giphy.com/media/2sbAFXxQgQtNe/giphy.gif'
    fill_in 'Gif Name', with: 'Caturday'
    fill_in 'Keyword 1', with: 'cat'
    fill_in 'Keyword 2', with: 'sink'
    fill_in 'Keyword 3', with: 'water'
    click_on 'Submit'
    
    expect(page).to have_content 'Caturday'
  end
end
