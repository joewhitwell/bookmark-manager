feature 'user can filter by tag' do
  before (:each) do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers', tags: [Tag.first_or_create(name: 'makes')])
    Link.create(url: 'http://www.google.com', title: 'Google', tags: [Tag.first_or_create(name: 'googles')])
    Link.create(url: 'http://www.bubbly.com', title: 'Bubble', tags: [Tag.first_or_create(name: 'bubbles')])
  end
  scenario 'filters links by tab bubbles' do
    visit '/tags/bubbles'
    expect(page.status_code).to eq(200)
    within 'ul#links' do
      expect(page).not_to have_content('Makers')
      expect(page).not_to have_content('Google')
      expect(page).to have_content('Bubble')
    end
  end
end
