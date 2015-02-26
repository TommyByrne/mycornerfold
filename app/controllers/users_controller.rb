class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @bookmarks = @user.bookmarks.group_by{ |b| b.topic}
    @likes = current_user.likes
    @topics = Topic.all


   end
end
