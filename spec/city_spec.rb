require "spec_helper"

describe(City) do
  describe('.all') do
    it('starts off enpty at first') do
      expect(City.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('saves the city to the city array') do
      test_city = City.new({name: 'Boston', id: nil})
      test_city.save()
      expect(City.all()).to(eq([test_city]))
    end
  end
















end
