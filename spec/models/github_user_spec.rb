require 'spec_helper'
require './app/models/github_user.rb'

describe GithubUser do
  context 'initialize' do
    let(:attributes) {
      { name: 'Thor',
        login: 'FatherWar',
        avatar_url: 'https://avatars1.githubusercontent.com/u/33960735?v=4' }
      }
    subject { GithubUser.new(attributes) }

    it 'exists with valid attributes' do
      expect(subject.name).to eq('Thor')
      expect(subject.username).to eq('FatherWar')
      expect(subject.picture).to eq('https://avatars1.githubusercontent.com/u/33960735?v=4')
    end
  end
end
