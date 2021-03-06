require 'spec_helper'

feature 'User functions' do
#  scenario 'allows a user to register' do
#    visit '/'
#    click_on 'Register Here!'
#    fill_in 'First Name', with: 'Bob'
#    fill_in 'Last Name', with: 'Robert'
#    fill_in 'Email', with: 'BobRobert@bob.com'
#    fill_in 'Password', with: 'bob'
#    fill_in 'Password Confirmation', with: 'bob'
#    check 'terms'
#    click_on 'Submit'
#
#    expect(page).to have_content 'Welcome, Bob!'
#  end
#
#  scenario 'allows a user to sign in' do
#    visit '/'
#    click_on 'Register Here!'
#    fill_in 'First Name', with: 'Bob'
#    fill_in 'Last Name', with: 'Robert'
#    fill_in 'Email', with: 'BobRobert@bob.com'
#    fill_in 'Password', with: 'bob'
#    fill_in 'Password Confirmation', with: 'bob'
#    check 'terms'
#    click_on 'Submit'
#
#    expect(page).to have_content 'Welcome, Bob!'
#    click_on 'Sign Out'
#
#    click_on 'Sign In'
#    fill_in 'Email', with: 'BobRober@bob.com'
#    fill_in 'Password', with: 'bob'
#    click_on 'Submit'
#  end

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
    fill_in 'Gif Description', with: 'Caturday'
    fill_in 'Keyword 1', with: 'cat'
    fill_in 'Keyword 2', with: 'sink'
    fill_in 'Keyword 3', with: 'water'
    click_on 'Submit'

    expect(page).to have_content 'Caturday'
  end

  scenario 'a user can search gifs using the search box' do
    visit '/'

    click_on 'Add a Gif!'
    fill_in 'Gif Url', with: 'https://media.giphy.com/media/2sbAFXxQgQtNe/giphy.gif'
    fill_in 'Gif Description', with: 'Caturday'
    fill_in 'Keyword 1', with: 'cat'
    fill_in 'Keyword 2', with: 'sink'
    fill_in 'Keyword 3', with: 'water'
    click_on 'Submit'

    fill_in 'search', with: 'Caturday'

    expect(page).to have_content 'Caturday'
  end

  scenario 'a search will return gifs insensitive of case and exact match' do
    visit '/'

    click_on 'Add a Gif!'
    fill_in 'Gif Url', with: 'https://media.giphy.com/media/2sbAFXxQgQtNe/giphy.gif'
    fill_in 'Gif Description', with: 'Caturday'
    fill_in 'Keyword 1', with: 'cat'
    fill_in 'Keyword 2', with: 'sink'
    fill_in 'Keyword 3', with: 'water'
    click_on 'Submit'
    
    click_on 'Add a Gif!'
    fill_in 'Gif Url', with: 'http://media1.giphy.com/media/AWcJHrKRzYvo4/giphy.gif'
    fill_in 'Gif Description', with: 'Love Water!'
    fill_in 'Keyword 1', with: 'sphinx'
    fill_in 'Keyword 2', with: 'catty'
    fill_in 'Keyword 3', with: 'yay!'
    click_on 'Submit'

    fill_in 'search', with: 'cat'

    expect(page).to have_content 'Caturday'
    expect(page).to have_content 'Love Water!'
  end

  scenario 'a user can click on a gif and find out more information about it' do
    visit '/'

    click_on 'Add a Gif!'
    fill_in 'Gif Url', with: 'https://media.giphy.com/media/2sbAFXxQgQtNe/giphy.gif'
    fill_in 'Gif Description', with: 'Caturday'
    fill_in 'Keyword 1', with: 'cat'
    fill_in 'Keyword 2', with: 'sink'
    fill_in 'Keyword 3', with: 'water'
    click_on 'Submit'

    expect(page).to have_selector("img[src$='https://media.giphy.com/media/2sbAFXxQgQtNe/giphy.gif']")
  end

end
