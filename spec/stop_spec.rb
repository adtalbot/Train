require "spec_helper"

describe(Stop) do
  describe('.all') do
    it('lists all the stops') do
      test_stop = Stop.new({:id => 1, :city_id => 1, :train_id => 1})
      test_stop.save
      expect(Stop.all()).to(eq([test_stop]))
    end
  end

  describe('#add_station') do
    it('adds city_id and line_id to a station') do
      test_city = City.new({name: 'Boston', id: 1})
      test_city.save()
      test_train = Train.new({:line => "line", :id => 1})
      test_train.save()
      # test_stop = Stop.new({:id => 1, :city_id => 1, :train_id => 1})
      # test_stop.save
      expect(Stop.new.add_station(1,1)).to(eq([test_station][test_stop]))
    end
  end
















end
