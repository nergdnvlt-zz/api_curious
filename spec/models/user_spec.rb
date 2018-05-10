require 'rails_helper'

describe User do
  describe 'Slug validation' do
    it 'creates a slug' do
      myself = create(:user)

      expect(myself.slug).to eq(myself.username)
    end
  end
end
