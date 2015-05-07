class Stop
  attr_reader(:id, :city_id, :train_id)

  define_method(:initialize) do |attributes|
    @id = attributes.fetch(:id)
    @city_id = attributes.fetch(:city_id)
    @train_id = attributes.fetch(:train_id)
  end

  define_singleton_method(:all) do
    returned_stops = DB.exec("SELECT * from stops;")
    stops = []
    returned_stops.each() do |stop|
      id = stop.fetch("id").to_i()
      city_id = stop.fetch("city_id").to_i()
      train_id = stop.fetch("train_id").to_i()
      stops.push(Stop.new({:id => id, :city_id => city_id, :train_id => train_id}))

    end
    stops
  end

  def save
    result = DB.exec("INSERT into stops (id, city_id, train_id) VALUES (#{@id}, #{city_id}, #{train_id}) RETURNING id;")
    @id = result.first().fetch('id').to_i()
  end

  def == another_stop
    self.id  == another_stop.id

  end



  def add_station city_id, line_id
    results = DB.exec("SELECT id FROM stops WHERE id = #{self.id()};")

    results.each do |result|
     city = DB.exec("SELECT * from cities where id = #{city_id()};").to-i
     city_id = city.first.fetch("id")
     line = DB.exec("SELECT * from trains where id = #{line_id()};").to_i
     line_id = line.first.fetch("id")
     stations<<Stop.new({:id => nil, :city_id => city_id, :train_id => line_id})

   end
   stations
end






end
