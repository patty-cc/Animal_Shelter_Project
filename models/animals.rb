require_relative('../db/sql_runner.rb')

class Animal

  attr_accessor :id, :name, :type, :age, :adoptable, :date_entered

  def initialize(array)
    @id = array['id'].to_i if array['id']
    @name = array['name']
    @type = array['type']
    @age = array['age'].to_i
    @adoptable = array['adoptable']
    @date_entered = array['date_entered']
  end

  def save()
    sql = 'INSERT INTO animals (
    name,
    type,
    age,
    adoptable,
    date_entered
    ) VALUES (
    $1, $2, $3, $4, $5
    )
    RETURNING *;'
    values = [@name, @type, @age, @adoptable, @date_entered]
    saved = SqlRunner.run( sql, values )
    @id = saved.first()['id'].to_i
  end

  def update()
    sql  = "UPDATE animals SET
    (
    name,
    type,
    age,
    adoptable,
    date_entered
    ) = (
    $1, $2, $3, $4, $5
    )
    WHERE id = $6;"
    values =[@name, @type, @age, @adoptable, @date_entered, @id]
    SqlRunner.run( sql, values )
  end

  def self.all()
    sql = "SELECT * FROM animals"
    values = []
    animals = SqlRunner.run( sql, values )
    return animals.map{ |animal| Animal.new(animal) }
  end

  def self.delete_all()
    sql = "DELETE FROM animals"
    values = []
    SqlRunner.run( sql, values )
  end

  def self.find( type )
    sql = "SELECT * FROM animals
    WHERE type = $1;"
    values = [type]
    found = SqlRunner.run( sql, values )
    return Animal.new( found.first )
  end

end