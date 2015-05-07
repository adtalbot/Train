class City
  attr_reader(:id, :name)

  define_method(:initialize) do |attributes|
    @id = attributes.fetch(:id)
    @name = attributes.fetch(:name)
  end

  define_singleton_method(:all) do
    all_cities = DB.exec("SELECT * from cities;")
    cities = []
    all_cities.each() do |city|
      id = city.fetch("id").to_i()
      name = city.fetch("name")
      cities.push(City.new({:id => id, :name => name}))
    end
    cities
  end



def save
  result = DB.exec("INSERT into cities (name) VALUES ('#{@name}') RETURNING id")
  @id = result.first().fetch('id').to_i
end

  def == another_city
    self.name == another_city.name && self.id == another_city.id 
  end











end
