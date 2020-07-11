class Pet < ActiveRecord::Base
    validates :name, presence: true
    
    belongs_to :owner
    has_many :pet_pictures
    has_many :pictures, through: :pet_pictures

end