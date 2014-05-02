require 'spec_helper'

feature 'managing welcome' do
  scenario 'user can add gif' do
    visit '/'
    click_on 'Add New Gif'

    fill_in 'gif_url', with:'http://media.giphy.com/media/j1s5Sv4iolneE/giphy.gif'
    fill_in 'gif_name', with: 'gif not jif'
    fill_in 'gif_keyword_1', with: 'jif'
    fill_in 'gif_keyword_2', with: 'table'
    fill_in 'gif_keyword_3', with: 'mad'
    click_on 'Add My Gif'

    expect(page).to have_content('gif not jif')
    expect(page).to have_content('jif')
    expect(page).to have_content('table')
    expect(page).to have_content('mad')

  end
end