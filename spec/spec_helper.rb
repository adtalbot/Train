require "rspec"
require "pry"
require "city"
require "train"
require "pg"
require "stop"

DB = PG.connect({:dbname => "train_system_test"})


RSpec.configure do |config|
  config.after(:each) do
    DB.exec('DELETE from trains *;')
    DB.exec('DELETE from cities *;')
    DB.exec('DELETE from stops *;')
  end
end
