class Picture < ActiveRecord::Base
    validates :title, presence: true
    validates :filename, presence: true

    has_many :pet_pictures
    has_many :pets, through: :pet_pictures

    def get_picture
        "images/pets/#{self.filename}"
        #use the filename to fetch the picture
    end
end