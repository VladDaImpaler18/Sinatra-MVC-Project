Owner.create(
    :id => 1,
    :username => "Animal Shelter".downcase,
    :password => "Super Secrets", 
    :phone => "516-778-5555".to_phone,
    :street => "23 Cherry Ave",
    :city => "Cucamonga",
    :zip =>" 91701"
)

tester_1 = Owner.create(
    :username => "VladDaImpaler".downcase,
    :password => "asdf1234",
    :phone => "(212)669-3324".to_phone,
    :fname => "Vladimir",
    :lname => "Jimenez",
    :street => "144 Flower St.",
    :city => "Rome",
    :zip => "11232",
    :state => "NY"
)

tester_2 = Owner.create(
    :username => "Appletester".downcase,
    :password => "asdf1234",
    :phone => "(631)444-2945".to_phone,
    :fname => "Yonnie",
    :lname => "Macontosh",
    :street => "23 Broadway",
    :city => "New York",
    :zip => "11112",
    :state => "NY"
)

pet_1 = Pet.create(
    :name => "Mako",
    :breed => "Border Collie"
)
mako_pic = picture_1 = Picture.create(
    :title => "Mako's Puppy Picture",
    :filename => "#{RandomWordGenerator.composed(2, 20, '-')}_pic1.jpg",
    :caption => "Puppy Pic",
    :description => "One of the first pictures taken of Mako, 8-weeks old"
)

pet_2 = Pet.create(
    :name => "Luna",
    :breed => "Border Collie"
)
luna_pic = picture_2 = Picture.create(
    :title => "Luna's Puppy Picture",
    :filename => "#{RandomWordGenerator.composed(2, 20, '-')}_pic2.JPG",
    :caption => "Puppy Pic",
    :description => "One of the first pictures taken of Luna, 8-weeks old"
)
pet_1.owner = tester_1
pet_2.owner = tester_1
tester_1.pets << pet_1
tester_1.pets << pet_2
pet_1.pictures << mako_pic
pet_2.pictures << luna_pic

pet_3 = Pet.create(
    :name => "Spot",
    :breed => "Pitbull"
)

dog_pic = Picture.create(
    :title => "Baby Pitbull",
    :filename => "#{RandomWordGenerator.composed(2, 20, '-')}_pitbullPuppy.jpg",
    :caption => "Puppy Pit",
    :description => "Pitbull, not the singer"
)

pet_3.pictures << dog_pic

pet_4 = Pet.create(
    :name => "Sasha",
    :breed => "Siamese"
)

cat_pic = Picture.create(
    :title => "Fancy cat",
    :filename => "#{RandomWordGenerator.composed(2, 20, '-')}_cat pic4.jpg",
    :caption => "Cat pose",
    :description => "Siamese cat"
)
pet_4.pictures << cat_pic

pet_5 = Pet.create(
    :name => "Princess",
    :breed => "American Shorthair"
)

pet_3.owner = tester_2
pet_4.owner = tester_2
tester_2.pets << pet_3
tester_2.pets << pet_4
tester_2.pets << pet_5

pet_6 = Pet.create(
    :name => "Shredder",
    :breed => "Lab rat"
)

rat_pic = Picture.create(
    :title => "Ratboi",
    :filename => "#{RandomWordGenerator.composed(2, 20, '-')}_rat_pict5.jpg",
    :caption => "Lab Rat",
    :description => "Albino lab rat"
)
pet_6.pictures << rat_pic

pet_7 = Pet.create(
    :name => "Slithers",
    :breed => "Snake"
)

snake_pic = Picture.create(
    :title => "Baby Snake doo doo doo doo",
    :filename => "#{RandomWordGenerator.composed(2, 20, '-')}_baby Snake pic.jpg",
    :caption => "Snake Pic",
    :description => "Baby snake in hand"
)

pet_7.pictures << snake_pic