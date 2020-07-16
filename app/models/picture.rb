class Picture < ActiveRecord::Base
    validates :title, presence: true
    validates :filename, presence: true

    has_many :pet_pictures
    has_many :pets, through: :pet_pictures

    def get_picture_path
        "images/pets/#{self.filename}"
        #use the filename to fetch the picture
    end

    def filename
        self[:filename].split("_").last
    end

    def actual_filename
        filename.split(".").first
    end
end