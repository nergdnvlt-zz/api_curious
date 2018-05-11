class GithubUserService
  def initialize(username, current_user)
    @current_user = current_user
    @username = username
    @client_id = ENV['client_id']
    @client_secret = ENV['client_secret']
  end

  def profile
    @profile = GithubUser.new(raw_profile, @username)
  end

  private

  def faraday_get
    if @current_user.username == @username
      Faraday.new(url: 'https://api.github.com/user')
    else
      Faraday.new(url: "https://api.github.com/users/#{@username}?client_id=#{@client_id}&client_secret=#{@client_secret}")
    end
  end

  def request
    faraday_get.get do |req|
      req.headers['Authorization'] = "token #{@current_user.oauth_token}"
    end
  end

  def raw_profile
    JSON.parse(request.body, symbolize_names: true)
  end
end
