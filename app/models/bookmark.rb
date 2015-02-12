class Bookmark < ActiveRecord::Base
  belongs_to :topic
  accepts_nested_attributes_for :topic

  def self.build_card(params)
    bookmark = new(params)
    thumbnail = ThumbnailService.new(params[:url])
    bookmark.title = thumbnail.title
    bookmark.thumbnail_url = thumbnail.url
    bookmark
  end
end