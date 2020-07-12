class Owner < ActiveRecord::Base
    has_secure_password
    validates :username, presence: true
    validates :password, presence: true

    has_many :pets
end