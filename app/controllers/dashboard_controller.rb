require 'octokit'
require 'json'

class DashboardController < ApplicationController

  def index
    @user = User.find(session[:user_id])
    @client = Octokit::Client.new(:access_token => "#{@user.token}")
    # @g_user = @client.user
    # list = []
    # @client.repos.each do |repo|
    #   list << repo.language
    # end
    # raise
  end

  def language
    @user = User.find(session[:user_id])
    @client = Octokit::Client.new(:access_token => "#{@user.token}")
    arr = []
    @client.repos.each do |lang|
      arr << lang.language
    end
    count = Hash.new(0)
    arr.each do |lang|
      if lang
        count[lang] += 1
      else
        count["Other"] += 1
      end
    end
    @count = count.to_json
    render json: @count

    # another way to do above with array
    # <% counts = [] %>
    # <% count_index = 0 %>
    # <% arr.to_set.each do |lang| %>
    #   <% arr.each do |repo_lang| %>
    #     <% if lang == repo_lang %>
    #       <% if counts[count_index] == nil %>
    #         <% counts[count_index] = 1 %>
    #       <% else %>
    #         <% counts[count_index] += 1 %>
    #       <% end %>
    #     <% end %>
    #   <% end %>
    #   <% count_index += 1 %>
    # <% end %>
    #
    # <%= arr.to_set %>
    # <%= counts %>
  end

end
