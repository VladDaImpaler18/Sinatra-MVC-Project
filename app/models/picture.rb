class Picture < ActiveRecord::Base
    validates :title, presence: true
    validates :filename, presence: true

    has_many :pet_pictures
    has_many :pets, through: :pet_pictures


    def get_picture_path
        "/images/pets/#{self[:filename]}"
    end

    def filename
        self[:filename].split("_").last
    end

    def filename=(arg) #look into this when  Only used for console edits
        num_of_words = ENV["WORDS"].to_i
        num_of_characters = ENV["LETTERS"].to_i
        if !self[:filename].nil?
            self[:filename]="#{self[:filename].split("_").first}_#{arg}" #seed data input
        elsif !arg.split("_").first.size==num_of_characters
            self[:filename]="#{RandomWordGenerator.composed(num_of_words,num_of_characters,"-")}_#{arg}"
        else
            self[:filename]=arg
        end
     end

     def filename_salted
        self[:filename]
    end

    def actual_filename
        filename.split(".").first
    end
end