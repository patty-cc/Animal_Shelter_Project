require_relative('../db/sql_runner.rb')

class Owner

  attr_accessor :id, :first_name, :last_name, :address, :city

  def initialize (array)
    @id = array['id'].to_i if array['id']
    @first_name = array['first_name']
    @last_name = array['last_name']
    @address = array['address']
    @city = array['city']
  end

  def save()
    sql = "INSERT INTO owners (
    first_name,
    last_name,
    address,
    city
    ) VALUES (
    $1, $2, $3, $4
    )
    RETURNING *;"
    values = [@first_name, @last_name, @address, @city]
    saved = SqlRunner.run( sql, values )
    @id = saved.first()['id'].to_i
  end

  def update
    sql = "UPDATE owners SET (
    first_name,
    last_name,
    address,
    city
    ) = (
    $1, $2, $3, $4
    )
    WHERE id = $5;"
    values = [@first_name, @last_name, @address, @city, @id]
    SqlRunner.run( sql, values)
  end

  def self.all()
    sql = "SELECT * FROM owners"
    values = []
    owners = SqlRunner.run( sql, values )
    return owners.map{ |owner| Owner.new(owner)}
  end

  def self.delete_all()
    sql = "DELETE FROM owners"
    values = []
    SqlRunner.run( sql, values )
  end

end
