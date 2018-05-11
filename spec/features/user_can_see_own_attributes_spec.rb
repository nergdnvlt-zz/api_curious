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
      expect(page).to have_css('.pic')

      expect(page).to have_css('.name')
      expect(page).to have_content('Tyler Lundgren')

      expect(page).to have_css('.username')
      expect(page).to have_content('nergdnvlt')

      expect(page).to have_css('.email')
      expect(page).to have_content('tylerlundgren@yahoo.com')

      expect(page).to have_css('.location')
      expect(page).to have_content('Boulder, CO')

      expect(page).to have_css('.bio')

      expect(page).to have_css('.followers')
      expect(page).to have_content('1')

      expect(page).to have_css('.following')
      expect(page).to have_content('13')

      expect(page).to have_css('.public_repos')
      expect(page).to have_content('35')
    end
  end

  scenario 'see another persons public account info' do
    VCR.use_cassette('features/user_can_see_another_profile') do
      visit '/'

      click_on 'Login With Github'
      expect(current_path).to eq(root_path)

      visit '/shniks'
      expect(current_path).to eq('/shniks')

      expect(page).to have_css('.pic')

      expect(page).to have_css('.name')
      expect(page).to have_content('Nikhil')

      expect(page).to have_css('.username')
      expect(page).to have_content('Shniks')

      expect(page).to have_css('.email')
      expect(page).to have_css('.location')
      expect(page).to have_css('.bio')
      expect(page).to have_css('.followers')
      expect(page).to have_css('.following')
      expect(page).to have_css('.public_repos')
    end
  end
end
