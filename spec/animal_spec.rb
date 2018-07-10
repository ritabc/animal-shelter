require 'rspec'
require 'animal'
require 'customer'
require 'pry'
require 'pg'
require 'spec_helper'

describe(Animal) do
  describe(".all") do
    it('will list all instances of Animal class') do
      expect(Animal.all()).to(eq([]))
    end
  end
  describe('#initialize') do
    it('will take in attributes and return complete animal object') do
      animal_test = Animal.new({:id => nil, :name => 'Bubbles', :gender => "Female", :admittance_date => Date.new(2018, 7, 10), :species => "Dog", :breed => "Shitzu", :customer_id => nil})
      expect(animal_test.name).to(eq("Bubbles"))
    end
  end
  describe('#save') do
    it('will save instance of Animal to the database') do
      animal_test = Animal.new({:id => nil, :name => 'Bubbles', :gender => "Female", :admittance_date => Date.new(2018, 7, 10), :species => "Dog", :breed => "Shitzu", :customer_id => nil})
      animal_test.save()
      expect(Animal.all()).to(eq([animal_test]))
    end
  end
  describe ('#==') do
    it('will compare two instances with the same description and will equate them') do
      animal_test = Animal.new({:id => nil, :name => 'Bubbles', :gender => "Female", :admittance_date => Date.new(2018, 7, 10), :species => "Dog", :breed => "Shitzu", :customer_id => nil})
      animal_test2 = Animal.new({:id => nil, :name => 'Bubbles', :gender => "Female", :admittance_date => Date.new(2018, 7, 10), :species => "Dog", :breed => "Shitzu", :customer_id => nil})
      expect(animal_test).to(eq(animal_test2))
    end
  end
  describe (".sort") do
    it('will sort animals by parameter passed in') do
      animal_test = Animal.new({:id => nil, :name => 'Leo', :gender => "Female", :admittance_date => Date.new(2018, 7, 10), :species => "Dog", :breed => "Shitzu", :customer_id => nil})
      animal_test2 = Animal.new({:id => nil, :name => 'Bubbles', :gender => "Male", :admittance_date => Date.new(2018, 7, 10), :species => "Dog", :breed => "Golden Retriever", :customer_id => nil})
      animal_test.save()
      animal_test2.save()
      expect(Animal.sort(:name)).to(eq([animal_test2, animal_test]))
    end
  end
  describe ('#adopted') do
    it('will grab id of a customer and add it to the adopted pets instance') do
      customer_test = Customer.new({:id => nil, :name => 'Tedd', :phone => '919-555-1234', :species_pref => 'Dog', :breed_pref => 'Shitzu'})
      customer_test.save()
      customers = Customer.all[0]
      animal_test = Animal.new({:id => nil, :name => 'Leo', :gender => "Female", :admittance_date => Date.new(2018, 7, 10), :species => "Dog", :breed => "Shitzu", :customer_id => nil})
      animal_test.save()
      animal_test.adopted(customer_test.name, customer_test.phone)
      expect(animal_test.customer_id).to(eq(customer_test.id))
    end
  end
end
