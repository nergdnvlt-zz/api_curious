require "rails_helper"
require './spec/support/omniauth'

feature 'user can their own repos' do
  scenario 'on their profile page' do
    VCR.use_cassette('features/user_can_see_own_repos_on_profile') do
      visit '/'

      click_on 'Login With Github'
      expect(current_path).to eq(root_path)

      click_on 'Profile'
      expect(current_path).to eq('/nergdnvlt')

      expect(page).to have_css('.repo', count: 6)
    end
  end
end
