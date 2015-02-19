class IncomingController < ApplicationController
  respond_to :json
  skip_before_action :verify_authenticity_token, only: [:create]


  def create
    puts "INCOMING PARAMS HERE: #{params}"

    @user = User.where(email: params["envelope"]["sender"]).take
    @topic = Topic.where(email: params["message"]["headers"]["subject"]).take

    unless @topic
      topic = Topic.new(title: params["message"]["headers"]["subject"])
      topic.save!
    end

    @bookmark = Bookmark.new(url: params["body-plain"], topic: @topic)
    bookmark.save!
    head 200
  rescue => e
    puts "failed because #{e}"

  end
end