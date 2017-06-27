feature 'Adding links' do
  scenario 'use form to submit a new link' do
    visit '/links/new'
    fill_in 'url', with: 'https://www.google.co.uk/'
    fill_in 'title', with: 'Google'
    click_button 'Create link'

    expect(current_path).to eq '/links'


    within 'ul#links' do
      expect(page).to have_content('Google')

    end
  end
end
