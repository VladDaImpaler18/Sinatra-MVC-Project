class Dog < ActiveRecord::Base
    validates :dog, presence: true
    
end