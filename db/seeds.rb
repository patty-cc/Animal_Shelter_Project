require_relative('../models/animals.rb')
require_relative('../models/owner.rb')
require_relative('../models/adoptions.rb')
require('pry')

Adoption.delete_all()
Animal.delete_all()
Owner.delete_all()

animal1 = Animal.new({
  "name" => "Rover",
  "type" => "dog",
  "age" => "4",
  "adoptable" => true,
  "date_entered" => "15/07/2017"
  })
animal1.save()

animal2 = Animal.new({
  "name" => "Kiera",
  "type" => "dog",
  "age" => "2",
  "adoptable" => false,
  "date_entered" => "15/05/2017"
  })
animal2.save()

animal3 = Animal.new({
  "name" => "Coisty",
  "type" => "hamster",
  "age" => "1",
  "adoptable" => true,
  "date_entered" => "20/05/2017"
  })
animal3.save()

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
  "owner_id" => owner2.id
  })
adoption1.save()

adoption2 = Adoption.new({
  "animal_id" => animal2.id,
  "owner_id" => animal1.id
  })

binding.pry
nil
