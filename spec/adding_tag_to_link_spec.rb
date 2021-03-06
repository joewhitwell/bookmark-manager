feature 'users can add a tag' do
  scenario 'user adds gardening tag' do
    visit '/links/new'
    fill_in 'url', with: 'http://www.gardenersworld.com/'
    fill_in 'title', with: 'gardenersworld'
    fill_in 'tags', with: 'gardening'
    click_button 'Create link'

    link = Link.first
    expect(link.tags.map(&:name)).to include('gardening')
  end
end

feature 'users can add multiple tags' do
  scenario 'user adds gardening and business tag' do
    visit '/links/new'
    fill_in 'url', with: 'http://www.gardenersworld.com/'
    fill_in 'title', with: 'gardenersworld'
    fill_in 'tags', with: 'gardening,leisure'
    click_button 'Create link'
    link = Link.first
    expect(link.tags.map(&:name)).to include('gardening')
    expect(link.tags.map(&:name)).to include('leisure')
  end
end
