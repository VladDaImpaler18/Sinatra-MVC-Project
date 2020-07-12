class Pet < ActiveRecord::Base
    validates :name, presence: true
    
    belongs_to :owner
    has_many :pet_pictures
    has_many :pictures, through: :pet_pictures

    def self.profile_pic
        Picture.find_by_id(self.profile)
    end

    def self.profile_pic=(picture_id)
        self.profile = picture_id
        self.profile_pic
    end
end