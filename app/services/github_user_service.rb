class GithubUserService
  def initialize(username, token=nil)
    @username = username
    @token = token
    @client_id = ENV['client_id']
    @client_secret = ENV['client_secret']
  end

  def profile
    @profile = GithubUser.new(raw_profile)
  end

  private

  def faraday_get
    Faraday.new(url: "https://api.github.com/users/#{@username}?client_id=#{@client_id}&client_secret=#{@client_secret}")
  end

  def request
    faraday_get.get do |req|
      req.headers['Authorization'] = @token
    end
  end

  def raw_profile
    JSON.parse(request.body, symbolize_names: true)
  end
end
