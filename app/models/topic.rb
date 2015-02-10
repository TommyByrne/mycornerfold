class Topic < ActiveRecord::Base
  belongs_to :user
    has_many :bookmarks

    def hashtag
      ("#"+title)
    end
end
