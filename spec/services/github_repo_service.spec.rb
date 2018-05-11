require 'rails_helper'

describe GithubRepoService do
  describe '#repo' do
    it 'gives user profile info' do
      VCR.use_cassette('services/github_repo_service') do
        create(:user)
        end_repos = GithubUserService.new('nergdnvlt').repos

        expect(end_repos.count).to eq(6)
        expect(end_repos[0].keys).to eq[:name, :link, :language]
      end
    end
  end
end
