Owner.create(
    :id => 1
    :username => "Animal Shelter".downcase
    :password => "Super Secrets" 
    :phone => "516-778-5555".to_phone
    :street => "23 Cherry Ave"
    :city => "Cucamonga"
    :zip =>" 91701"
)

tester_1 = Owner.create(
    :username => "VladDaImpaler".downcase
    :password => "asdf1234"
    :phone => "(212)669-3324".to_phone
    :fname => "Vladimir"
    :lname => "Jimenez"
    :street => "144 Flower St."
    :city => "Rome"
    :zip => "11232"
    :state => "NY"
)

tester_2 = Owner.create(
    :username => "Appletester".downcase
    :password => "asdf1234"
    :phone => "(631)444-2945".to_phone
    :fname => "Yonnie"
    :lname => "Macontosh"
    :street => "23 Broadway"
    :city => "New York"
    :zip => "11112"
    :state => "NY"
)

pet_1 = Pet.create(
    :name => "Mako"
    :breed => "Border Collie"
)
pet_2 = Pet.create(
    :name => "Luna"
    :breed => "Border Collie"
)
pet_1.owner = tester_1
pet_2.owner = tester_1

pet_3 = Pet.create(
    :name => "Spot"
    :breed => "Pitbull"
)
pet_4 = Pet.create(
    :name => "Sasha"
    :breed => "Tommy Cat"
)
pet_3.owner = tester_2
pet_4.owner = tester_2

pet_5 = Pet.create(
    :name => "Princess"
    :breed => "Tabby cat"
)
pet_6 = Pet.create(
    :name => "Shredder"
    :breed => "Lab rat"
)
pet_7 = Pet.create(
    :name => "Slithers"
    :breed => "Snake"
)

Picture.create(
    :title => "Mako's Puppy Picture"
    :filename => "pic1.jpg"
    :caption => "Puppy Pic"
    :description => "One of the first pictures taken of Mako, 8-weeks old"
)