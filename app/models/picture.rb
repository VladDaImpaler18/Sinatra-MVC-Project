class Picture < ActiveRecord::Base
    validates :title, presence: true
    validates :filename, presence: true

    has_many :pet_pictures
    has_many :pets, through: :pet_pictures

    def get_picture
        imagepath = File.join(Dir.pwd, '')
        image = File.open()
    end
end