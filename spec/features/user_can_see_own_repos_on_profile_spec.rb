require "rails_helper"
require './spec/support/omniauth'

feature 'user can their own repos' do
  scenario 'on their profile page' do
    VCR.use_cassette('features/user_can_see_own_repos_on_profile') do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/'

      # click_on 'Login With Github'
      expect(current_path).to eq(root_path)

      click_on 'Visit Your Profile Here'

      expect(current_path).to eq('/nergdnvlt')

      expect(page).to have_css('.repo', count: 6)
    end
  end
end
