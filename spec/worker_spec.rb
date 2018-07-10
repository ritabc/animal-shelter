require 'rspec'
require 'worker'
require 'pry'
require 'spec_helper'

describe('Worker') do
  describe('#initialize') do
    it('will initialize a worker and return its id when the ID attribute is accessed') do
      worker_test = Worker.new({:id => nil})
      expect(worker_test.id).to(eq(nil))
    end
  end
  describe('#assign_customer') do
    it('will assign a customer to an animal') do
      customer_test = Customer.new({:id => nil, :name => 'Tedd', :phone => '919-555-1234', :species_pref => 'Dog', :breed_pref => 'Shitzu'})
      animal_test = Animal.new({:id => nil, :name => 'Leo', :gender => "Female", :admittance_date => Date.new(2018, 7, 10), :species => "Dog", :breed => "Shitzu", :customer_id => nil})
      customer_test.save
      animal_test.save
      Worker.assign_customer(animal_test, customer_test)
      expect(animal_test.customer_id).to(eq(customer_test.id))
    end
  end
end
