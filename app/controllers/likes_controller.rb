class LikesController < ApplicationController

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)

    if like.save
      flash[:notice]= "Bookmark was Liked"
      redirect_to topics_path
    else
      flash[:error]= "Bookmark was not able to be liked. Please try again."
      redirect_to topics_path
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    @like = current_user.likes.find(params[:id])

    if @like.destroy
      flash[:notice]= "Bookmark was unliked."
      redirect_to topics_path
    else
      flash[:error]= "Bookmark was unable to be unliked. Please try again."
      redirect_to topics_path
    end
  end
end
