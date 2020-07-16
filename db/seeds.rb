Owner.create(
    :id => 1,
    :username => "Animal Shelter", #downcase in inputs, and owners/index:12; application_controller:30,35
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
mako_pic = Picture.create(
    :title => "Mako's Puppy Picture",
    :filename => "unseaworthiness-shew_pic1.jpg",
    :caption => "Puppy Pic",
    :description => "One of the first pictures taken of Mako, 8-weeks old"
)

pet_2 = Pet.create(
    :name => "Luna",
    :breed => "Border Collie"
)
luna_pic = Picture.create(
    :title => "Luna's Puppy Picture",
    :filename => "warmheartedness-bawd_ic2.JPG",
    :caption => "Puppy Pic",
    :description => "One of the first pictures taken of Luna, 8-weeks old"
)
pet_1.owner = tester_1


pet_2.owner = tester_1


tester_1.pets << pet_1
tester_1.pets << pet_2
tester_1.save

pet_1.pictures << mako_pic
pet_2.pictures << luna_pic
pet_1.save
pet_2.save

pet_3 = Pet.create(
    :name => "Spot",
    :breed => "Pitbull"
)

dog_pic = Picture.create(
    :title => "Baby Pitbull",
    :filename => "downheartedness-awns_pitbullPuppy.jpg",
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
    :filename => "witchdoctors-whizkid_cat pic4.jpg",
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
pet_3.save
pet_4.save

tester_2.pets << pet_3
tester_2.pets << pet_4
tester_2.pets << pet_5
tester_2.save

pet_6 = Pet.create(
    :name => "Shredder",
    :breed => "Lab rat"
)

rat_pic = Picture.create(
    :title => "Ratboi",
    :filename => "reweighing-setscrews_rat_pict5.jpg",
    :caption => "Lab Rat",
    :description => "Albino lab rat"
)
pet_6.pictures << rat_pic
pet_6.save

pet_7 = Pet.create(
    :name => "Slithers",
    :breed => "Snake"
)

snake_pic = Picture.create(
    :title => "Baby Snake doo doo doo doo",
    :filename => "weens-disembowelment_baby Snake pic.jpg",
    :caption => "Snake Pic",
    :description => "Baby snake in hand"
)

pet_7.pictures << snake_pic
pet_7.save