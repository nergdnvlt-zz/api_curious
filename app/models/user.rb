class User < ApplicationRecord
  before_save :generate_slug

  def generate_slug
    self.slug = username.parameterize
  end

  def to_params
    slug
  end

  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid = auth_info.uid
      new_user.name = auth_info.extra.raw_info.name
      new_user.username = auth_info.info.nickname
      new_user.oauth_token = auth_info.credentials.token
    end
  end

  # def self.from_omniauth(auth_info)
  #   where(uid: auth_info[:uid]).first_or_create do |new_user|
  #     new_user.uid = auth_info.uid
  #     new_user.name = auth_info.extra.raw_info.name
  #     new_user.username = auth_info.info.nickname
  #   end
  #   update(oauth_token: auth_info.credentials.token)
  # end
end
