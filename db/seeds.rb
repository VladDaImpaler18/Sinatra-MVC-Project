Owner.create(
    :username => "Animal Shelter".downcase
    :password => "Super Secrets" 
    :phone => "516-778-5555"
    :street => "23 Cherry Ave"
    :city => "Cucamonga"
    :zip =>" 91701"
)

Pet.create(
    :name => "Mako"
    :breed => "Border Collie"
    :profile => 1
)

Picture.create(
    :title => "Mako's Puppy Picture"
    :filename => "pic1.jpg"
    :caption => "Puppy Pic"
    :description => "One of the first pictures taken of Mako, 8-weeks old"
)