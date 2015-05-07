require('spec_helper')

describe(Train) do
  describe('.all') do
    it('starts off empty at first') do
      expect(Train.all()).to(eq([]))
    end
  end
   describe('#save') do
     it('saves the train to the train array') do
       test_train = Train.new({:line => "line", :id => 1})
       test_train.save()
       expect(Train.all()).to(eq([test_train]))
     end
   end
 end
