class GithubUser
  attr_reader :name, :username, :picture

  def initialize(attrs)
    @name = attrs[:name]
    @username = attrs[:login]
    @picture = attrs[:avatar_url]
  end
end
