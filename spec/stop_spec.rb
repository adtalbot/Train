require "spec_helper"

describe(Stop) do
  describe('.all') do
    it('lists all the stops') do
      test_stop = Stop.new({:id => 1, :city_id => 1, :train_id => 1})
      test_stop.save
      expect(Stop.all()).to(eq([test_stop]))
    end
  end


















end
