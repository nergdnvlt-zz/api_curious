require "rails_helper"
require './spec/support/omniauth'

feature 'user can see a profile' do
  scenario 'see basic account info' do
    VCR.use_cassette('features/user_can_see_own_attributes') do
      # When I visit a userpage
      visit '/'

      click_on 'Login With Github'
      expect(current_path).to eq(root_path)

      click_on 'Profile'
      expect(current_path).to eq('/nergdnvlt')

      # I can see my profile pic, number of starred repo's, followers and who I'm following
      expect(page).to have_content('Tyler Lundgren')
      expect(page).to have_content('nergdnvlt')
    end
  end
end
