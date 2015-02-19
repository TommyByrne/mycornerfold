class IncomingController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    @user = User.where(email: params['sender']).take
    @topic = Topic.where(title: params['subject']).take

    unless @topic
      topic = Topic.new(title: params['subject'])
      topic.save!
    end

    @bookmark = Bookmark.build_card(url: params["stripped-text"])
    @bookmark.topic = @topic
    @bookmark.user  = @user
    @bookmark.save!

    head 200
  rescue => e
    puts "failed because #{e}"
    head 400
  end

end