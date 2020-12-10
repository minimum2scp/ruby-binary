require 'serverspec'

Dir["./spec/support/**/*.rb"].sort.each{ |f| require f }

set :backend, :docker

