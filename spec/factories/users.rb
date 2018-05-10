FactoryBot.define do
  factory :user do
    username 'nergdnvlt'
    name 'Tyler Lundgren'
    oauth_token "#{ENV['github_test']}"
  end
end
