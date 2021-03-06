require_relative('../db/sql_runner.rb')
require("pry-byebug")
require("pry")

class Animal

  attr_accessor :id, :name, :type, :age, :adoptable, :date_entered, :photo

  def initialize(array)
    @id = array['id'].to_i if array['id']
    @name = array['name']
    @type = array['type']
    @age = array['age'].to_i
    @vet_id = array['vet_id'].to_i
    @date_entered = array['date_entered']
    @photo = array['photo']
  end

  def save()
    sql = "INSERT INTO animals (
    name,
    type,
    age,
    vet_id,
    date_entered,
    photo
    ) VALUES (
    $1, $2, $3, $4, $5, $6
    )
    RETURNING *;"
    values = [@name, @type, @age, @vet_id, @date_entered, @photo]
    saved = SqlRunner.run( sql, values )
    @id = saved.first()['id'].to_i
  end

  def update()
    sql  = "UPDATE animals SET
    (
    name,
    type,
    age,
    vet_id,
    date_entered,
    photo
    ) = (
    $1, $2, $3, $4, $5, $6
    )
    WHERE id = $7;"
    values =[@name, @type, @age, @vet_id, @date_entered, @id]
    SqlRunner.run( sql, values )
  end

  def self.all()
    sql = "SELECT * FROM animals"
    values = []
    animals = SqlRunner.run( sql, values )
    return animals.map{ |animal| Animal.new(animal) }
  end

  def self.filter_by_vet_id(vet_id)
    sql ="SELECT * FROM animals
    WHERE vet_id = $1;"
    values = [vet_id]
    animals = SqlRunner.run( sql, values )
    return animals.map{ |animal| Animal.new(animal) }
  end

  def self.delete_all()
    sql = "DELETE FROM animals"
    values = []
    SqlRunner.run( sql, values )
  end

  def delete()
    sql = "DELETE FROM animals
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def self.find( id )
    sql = "SELECT * FROM animals
    WHERE id = $1;"
    values = [id]
    found = SqlRunner.run( sql, values )
    return found.map{ |animal_type| Animal.new( animal_type )}[0]
  end

  def status()
    sql = "SELECT * FROM vets
    WHERE id = $1;"
    values = [@vet_id]
    vets = SqlRunner.run( sql, values)
    return Status.new( vets.first )
  end

end
