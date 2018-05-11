class GithubProfilesController < ApplicationController
  def show
    @github_profile ||= GithubUserService.new(params[:username], current_user).profile
  end
end
