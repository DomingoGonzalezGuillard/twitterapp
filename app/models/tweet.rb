class Tweet < ApplicationRecord
    belongs_to :user
    has_many :tags

    attribute :hashtags



    after_create :create_tags

    def create_tags
        
        hashtags.split(",").each do |t|
           hashtag =  Hashtag.find_or_create_by name: t
           Tag.create tweet: self, hashtag: hashtag
        end
    end


    def creation_date
        created_at.strftime("%e %b %Y")
    end
end