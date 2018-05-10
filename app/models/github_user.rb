class GithubUser
  attr_reader :name,
              :username,
              :picture,
              :email,
              :location,
              :bio,
              :followers,
              :following,
              :public_repos

  def initialize(attrs)
    @name = attrs[:name]
    @username = attrs[:login]
    @email = attrs[:email]
    @location = attrs[:location]
    @picture = attrs[:avatar_url]
    @bio = attrs[:bio]
    @followers = attrs[:followers]
    @following = attrs[:following]
    @public_repos = attrs[:public_repos]
  end
end
