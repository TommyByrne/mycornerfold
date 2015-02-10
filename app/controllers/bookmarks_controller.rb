class BookmarksController < ApplicationController
  require 'link_thumbnailer'

  def index
    @bookmarks = Bookmark.all
  end

  def show
    @bookmarks = Bookmark.find(params[:id])
  end

  def new
    @bookmark = Bookmark.new
    # topic
  end

  def create
    @bookmark = Bookmark.build_card(bookmark_params)
    # @bookmar.topic =
    @bookmark.save!
      flash[:notice] = "Your bookmark was created successfully."
      redirect_to @bookmark
  rescue
      flash[:error] = "URL is not valid"
      redirect_to :back
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    if @bookmark.destroy
      flash[:notice] = "Your bookmark was deleted successfully."
      redirect_to bookmarks_path
    else
      flash[:error] = "There was an error deleting the bookmark."
      redirect_to @bookmark
    end
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
  end

  def update
    @bookmark = Bookmark.find(params[:id])
    if @bookmark.update_attributes(bookmark_params)
      flash[:notice] = "Bookmark was updated successfully."
      fredirect_to @bookmark
    else
      flash[:error] = "There was an error updating boomkark, please try again."
      render :edit
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:url)
  end
end
