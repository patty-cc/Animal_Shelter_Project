require_relative('../db/sql_runner.rb')

class Status

  def initialize( array )
    @id = array['id'].to_i if array['id']
    @status = array['status']
  end

  def save()
    sql = "INSERT INTO vets (
    status
    ) VALUES (
    $1
    )
    RETURNING*;"
    values = [@status]
    saved = SqlRunner.run( sql, values )
    @id = saved.first()['id'].to_i
  end

  def self.all()
    sql ="SELECT * FROM vets"
    values = []
    vets_array = SqlRunner.run( sql, values )
    return vets_array.map{ |vet| Status.new(vet)}
  end

  def self.delete_all()
    sql = "DELETE FROM vets"
    values = []
    SqlRunner.run( sql, values )
  end

end
