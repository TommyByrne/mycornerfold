class IncomingController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]


  def create
    puts "INCOMING PARAMS HERE: #{params}"

    @user = User.where(email: params["sender"]).take
    @topic = Topic.where(email: params["subject"]).take

    unless @topic
      topic = Topic.new(title: params["subject"])
      topic.save!
    end

    @bookmark = Bookmark.new(url: params["body-plain"], topic: @topic)
    bookmark.save!
    head 200
  rescue => e
    puts "failed because #{e}"

  end
end