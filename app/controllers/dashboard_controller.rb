require 'octokit'

class DashboardController < ApplicationController

  def index
    # client = Octokit::Client.new({ login: ENV["GITHUB_TOKEN"],
    #                                password: ENV["GITHUB_SECRET"]
    #                                })

    @user = User.find(session[:user_id])
    @g_user = Octokit::user "#{@user.username}"   ## 'xbell'
    # raise
  end

end
