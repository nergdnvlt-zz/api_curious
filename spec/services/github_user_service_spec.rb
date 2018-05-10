require 'rails_helper'

describe GithubUserService do
  describe '#profile' do
    it 'gives user profile info' do
      VCR.use_cassette('services/github_user_service') do

        user = GithubUserService.new('nergdnvlt').profile

        expect(user.username).to eq('nergdnvlt')
        expect(user.name).to eq('Tyler Lundgren')
        expect(user.picture).to be_a String
      end
    end
  end
end
