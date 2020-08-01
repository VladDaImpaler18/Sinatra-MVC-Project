class Pet < ActiveRecord::Base
    validates :name, presence: true
    
    belongs_to :owner
    has_many :pet_pictures
    has_many :pictures, through: :pet_pictures

    def profile_pic
        if self.profile.nil?
            image_location = "/images/pets/worktables-longsword_default logo.jpg"
        else
            pic = Picture.find_by_id(self.profile)
            image_location = pic.get_picture_path
        end
        image_location
    end

    def profile_pic_filename
        self.profile_pic.split("_").last.split(".").first
    end

    def profile_pic=(picture_id)
        self.profile = picture_id
    end

    def available_for_adoption?
        self.owner.nil? || (self.owner.username == ENV["ADMIN_USERNAME"] && self.owner.id == 1)
    end

end
#/pets/:pets_id/pictures/:picture_id