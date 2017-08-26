require_relative('../db/sql_runner.rb')

class Adoption

  attr_accessor :id, :animal_id, :owner_id

  def initialize( array )
    @id = array['id'].to_i if array['id']
    @animal_id = array['animal_id']
    @owner_id = array['owner_id']
  end

  def save()
    sql = "INSERT INTO adoptions (
    animal_id,
    owner_id
    ) VALUES (
    $1, $2
    )
    RETURNING*;"
    values = [@animal_id, @owner_id]
    saved = SqlRunner.run( sql, values )
    @id = saved.first()['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM adoptions"
    values = []
    SqlRunner.run( sql, values )
  end

  def self.all()
    sql = "SELECT * FROM adoptions"
    values = []
    adopts = SqlRunner.run( sql, values )
    return adopts.map{ |adopt| Adoption.new(adopt) }
  end

  def owner()
    sql = "SELECT * FROM owners
    WHERE id = $1;"
    values = [@owner_id]
    owners = SqlRunner.run( sql, values)
    return Owner.new( owners.first )
  end

  def animal()
    sql = "SELECT * FROM animals
    WHERE id = $1;"
    values = [@animal_id]
    animals = SqlRunner.run( sql, values)
    return Animal.new( animals.first )
  end

end
