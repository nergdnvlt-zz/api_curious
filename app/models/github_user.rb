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

  def initialize(attrs, url_username)
    @url_username = url_username
    @name = attrs[:name]
    @username = attrs[:login]
    @email = attrs[:email]
    @location = attrs[:location]
    @picture = attrs[:avatar_url]
    @bio = attrs[:bio]
    @followers = attrs[:followers]
    @following = attrs[:following]
    @public_repos = attrs[:public_repos]
    @repos = []
  end

  def repos
    @repos = GithubRepoService.new(@url_username).repos
  end
end
