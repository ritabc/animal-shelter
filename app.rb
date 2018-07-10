require('sinatra')
require("sinatra/reloader")
also_reload('lib/**/*.rb')
require('./lib/animal')
require('./lib/worker')
require('./lib/customer')
require('pg')
require('pry')

DB = PG.connect({:dbname => "animal_shelter"})

get('/') do
  erb(:index)
end

get('/work') do
  erb(:add)
end

post('/pet_success') do
  name = params.fetch('pet-name')
  gender = params.fetch('gender')
  species = params.fetch('species')
  breed = params.fetch('breed')
  date = params.fetch('admittance_date')
  new_animal = Animal.new({:id => nil, :name => name, :gender => gender, :admittance_date => date, :species => species, :breed => breed, :customer_id => nil})
  new_animal.save()
  erb(:pet_success)
end

post('/adopter_success') do
  name = params.fetch('adopter-name')
  phone = params.fetch('phone')
  species_pref = params.fetch('species_pref')
  breed_pref = params.fetch('breed_pref')
  new_customer = Customer.new({:id => nil, :name => name, :phone => phone, :species_pref => species_pref, :breed_pref => breed_pref})
  new_customer.save()
  erb(:adopter_success)
end

get('/adoption') do
  @name_sorted = Animal.sort('name')
  erb(:sort_name)
end

get('/sort_time') do
  @time_sorted = Animal.sort('admittance_date')
  erb(:sort_time)
end
