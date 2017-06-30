feature "Sign up page" do
scenario "user visits url and inputs details, gets personalised confirmation" do
  visit ('/users/new')
  fill_in 'email', with: 'joe@hotmail.com'
  fill_in 'password', with: 'kettlefish129'
  click_button 'sign-up'
  expect(page).to have_content 'joe@hotmail.com'
  end
end
