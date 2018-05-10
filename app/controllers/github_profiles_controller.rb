class GithubProfilesController < ApplicationController
  def show
    @github_profile ||= GithubUserService.new(params[:username], session['token'])
  end

  # def show
  #   @github_profile = GithubUser.new((params[:username], session['token'])
  # end
end
