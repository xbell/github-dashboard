require 'octokit'

class DashboardController < ApplicationController

  def index
    @user = User.find(session[:user_id])
    @client = Octokit::Client.new(:access_token => "#{@user.token}")
    # @g_user = @client.user
    # raise
  end

end
