require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/city")
require("./lib/train")
require("pg")

DB = PG.connect({:dbname => "to_do"})
