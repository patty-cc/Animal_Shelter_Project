require_relative('../db/sql_runner.rb')

class Status

  def initialize
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
end
