require 'rails_helper'
require './spec/support/omniauth'

describe 'root path visitation' do
  scenario 'logging in' do
    VCR.use_cassette('features/user_can_login_with_github') do
      visit '/'

      expect(page.status_code).to eq(200)

      click_on "Login With Github"

      expect(current_path).to eq(root_path)
      expect(page).to have_content('Tyler')
    end
  end
end
