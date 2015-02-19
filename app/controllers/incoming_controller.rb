class IncomingController < ApplicationController
  respond_to :json
  # skip_before_action :verify_authenticity_token, only: [:create]
  skip_before_filter :verify_authenticity_token, only: [:create]


  def create
    puts "INCOMING PARAMS HERE: #{params}"

    @user = User.where(email: params['sender']).take
    @topic = Topic.where(title: params['subject']).take

    unless @topic
      topic = Topic.new(title: params['subject'])
      topic.save!
    end

    @bookmark = Bookmark.new(url: params["stripped-text"], user: @user, topic: @topic)
    @bookmark.save!
    head 200
  rescue => e
    puts "failed because #{e}"
  end
end