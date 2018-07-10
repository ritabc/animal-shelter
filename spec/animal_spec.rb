require 'rspec'
require 'animal'
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
end
