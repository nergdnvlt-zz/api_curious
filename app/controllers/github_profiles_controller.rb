class GithubProfilesController < ApplicationController
  def show
    @github_profile ||= GithubUserService.new(params[:username], current_user)
  end

  # def show
  #   @github_profile = GithubUser.new((params[:username], session['token'])
  # end
end
