class GithubRepo
  attr_reader :name, :link, :language

  def initialize(attrs)
    @name = attrs[:name]
    @link = attrs[:html_url]
    @language = attrs[:language]
  end
end
