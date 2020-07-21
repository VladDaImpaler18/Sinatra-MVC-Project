class Picture < ActiveRecord::Base
    validates :title, presence: true
    validates :filename, presence: true

    has_many :pet_pictures
    has_many :pets, through: :pet_pictures

    @@NUMBEROFWORDS = 2
    @@NUMBEROFCHARS = 20
    def get_picture_path
        "/images/pets/#{self[:filename]}"
    end

    def filename
        self[:filename].split("_").last
    end

    def filename=(arg) #look into this when standarizing
        if !self[:filename].nil?
            self[:filename]="#{self[:filename].split("_").first}_#{arg}" #seed data input
        elsif !arg.split("_").first.size==@@NUMBEROFCHARS
            self[:filename]="#{RandomWordGenerator.composed(@@NUMBEROFWORDS,@@NUMBEROFCHARS,"-")}_#{arg}"
        else
            self[:filename]=arg
        end
    end
    #new_pic = Picture.new(:title => "Generic Photo", :filename => "wellheads-wides_Border collie.jpg", :caption => "Stock Photo", :description => "This photo was taken from the Internet")
    def filename_salted
        self[:filename]
    end

    def actual_filename
        filename.split(".").first
    end
end