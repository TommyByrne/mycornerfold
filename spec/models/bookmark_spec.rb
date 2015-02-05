require 'rails_helper'

RSpec.describe Bookmark, :type => :model do

  it "is valid with a url and title" do
    bookmark = Bookmark.new(
      url: 'http://www.example.com',
      title: 'Example'
      )
    expect(bookmark).to be_valid
  end

  it "belongs to a topic" do
    bookmark = Bookmark.new
    topic    = Topic.new
    topic.bookmarks << bookmark
    expect(bookmark.topic).to be topic
  end

  it "can not be deleted unless current user is the creator"



end
