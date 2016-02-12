require 'octokit'
require 'json'

class DashboardController < ApplicationController

  def index
    @user = User.find(session[:user_id])
    @client = Octokit::Client.new(:access_token => "#{@user.token}")
  end

  def languages
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

  def events
    @user = User.find(session[:user_id])
    @client = Octokit::Client.new(:access_token => "#{@user.token}")
    # last_events = @client.user_events("#{@user.username}").sort_by &:created_at
    # above only gets back 30 events

    event_arr = []
    events_pg1 = @client.user_events("#{@user.username}", {:per_page => 100, :page => 1})
    events_pg2 = @client.user_events("#{@user.username}", {:per_page => 100, :page => 2})
    events_pg3 = @client.user_events("#{@user.username}", {:per_page => 100, :page => 3})
    event_arr = events_pg1 + events_pg2 + events_pg3

    event_types = []
    event_arr.each do |event|
      event_types << event.type
    end
    events = Hash.new(0)
    event_types.each do |type|
      events[type] += 1
    end
    @events = events.to_json
    render json: @events
  end

end
