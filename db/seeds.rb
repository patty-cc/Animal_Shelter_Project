require_relative('../models/animals.rb')
require_relative('../models/owner.rb')
require_relative('../models/adoptions.rb')
require_relative('../models/status.rb')
require('pry')

Adoption.delete_all()
Animal.delete_all()
Owner.delete_all()
Status.delete_all()

vet_status1 = Status.new({
  "status" => "At vets. Unavailable for adoption"
  })
vet_status1.save()

vet_status2 = Status.new({
  "status" => "Ready for adoption"
  })
vet_status2.save()

animal1 = Animal.new({
  "name" => "Rover",
  "type" => "dog",
  "age" => "4",
  "vet_id" => vet_status1.id,
  "date_entered" => "2017-05-12",
  "photo" => "dog.jpg"
  })
animal1.save()

animal2 = Animal.new({
  "name" => "Kiera",
  "type" => "dog",
  "age" => "2",
  "vet_id" => vet_status2.id,
  "date_entered" => "2017-07-25",
  "photo" => "terrier.jpg"
  })
animal2.save()

animal3 = Animal.new({
  "name" => "Coisty",
  "type" => "hamster",
  "age" => "1",
  "vet_id" => vet_status1.id,
  "date_entered" => "2017-02-20",
  "photo" => "hamster.jpg"
  })
animal3.save()

animal4 = Animal.new({
  "name" => "Willow",
  "type" => "cat",
  "age" => "7",
  "vet_id" => vet_status2.id,
  "date_entered" => "2017-04-9",
  "photo" => "cat.jpg"
  })
animal4.save()

owner1 = Owner.new({
  "first_name" => "Iain",
  "last_name" => "Paterson",
  "address" => "8 Rowantree Grove",
  "city" => "Edinburgh"
  })
owner1.save()

owner2 = Owner.new({
  "first_name" => "Colleen",
  "last_name" => "Strachan",
  "address" => "32 Foxknowe Place",
  "city" => "Livingston"
  })
owner2.save()

adoption1 = Adoption.new({
  "animal_id" => animal1.id,
  "owner_id" => owner2.id,
  "date_adopt" => "2017-06-9"
  })
adoption1.save()

adoption2 = Adoption.new({
  "animal_id" => animal2.id,
  "owner_id" => owner1.id,
  "date_adopt" => "2017-07-12"
  })
adoption2.save()


binding.pry
nil
