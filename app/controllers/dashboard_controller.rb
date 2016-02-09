require 'octokit'

class DashboardController < ApplicationController

  def index
    @user = User.find(session[:user_id])
    @g_user = Octokit::user "#{@user.username}"   ## 'xbell'
  end

end
