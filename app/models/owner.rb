class Owner < ActiveRecord::Base
    has_secure_password
    validates :username, presence: true, uniqueness: true
    validates :password, presence: true
    
    validates_and_formats_phones :phone, '### ###-####'

    has_many :pets
end