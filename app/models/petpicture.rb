class PetPicture < ActiveRecord::Base
    belongs_to :pet
    belongs_to :picture
    
end