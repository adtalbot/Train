class Train
  attr_reader(:id, :line)


  def initialize attributes
    @id = attributes.fetch(:id).to_i()
    @line = attributes.fetch(:line)
  end


  def save
    result = DB.exec("INSERT into trains (line, id) VALUES ('#{@line}', #{@id}) RETURNING id;")
    @id = result.first().fetch('id').to_i()
  end

  def self.all
    trains = []
    returned_trains = DB.exec("SELECT * from trains;")

    returned_trains.each do |train|
      id = train.fetch('id').to_i()
      line = train.fetch('line')

      trains.push(Train.new({:id => id, :line=> line}))
    end
    trains
  end

  def == another_train
    self.id == another_train.id
  end




end
