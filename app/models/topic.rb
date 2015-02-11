class Topic < ActiveRecord::Base
  belongs_to :user
    has_many :bookmarks

after_save
    def hashtag
      ("#"+title)
    end
end
