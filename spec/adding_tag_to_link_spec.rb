feature 'users can add a tag' do
  scenario 'user adds gardening tag' do
    visit '/links/new'
    fill_in 'url', with: 'http://www.gardenersworld.com/'
    fill_in 'title', with: 'gardenersworld'
    fill_in 'tag', with: 'gardening'
    click_button 'Create link'
    
    within 'ul#links' do
      expect(page).to have_content('gardening')
    end
  end
end
