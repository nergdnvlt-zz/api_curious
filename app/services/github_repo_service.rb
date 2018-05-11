class GithubRepoService

  def initialize(username)
    @username = username
    @client_id = ENV['client_id']
    @client_secret = ENV['client_secret']
  end

  def repos
    limit_repos.map do |repo|
      GithubRepo.new(repo)
    end
  end

  private

  def get_repo
    Faraday.new(url: "https://api.github.com/users/#{@username}/repos?client_id=#{@client_id}&client_secret=#{@client_secret}")
  end

  def repo_response
    get_repo.get { |request| }
  end

  def raw_repo
    JSON.parse(repo_response.body, symbolize_names: true)
  end

  def limit_repos
    raw_repo[0..5]
  end
end
