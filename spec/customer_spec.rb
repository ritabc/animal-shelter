require 'rspec'
require 'customer'
require 'pry'
require 'spec_helper'


describe('Customer') do
  describe(".all") do
    it("will list all instances of Customer class") do
      expect(Customer.all()).to(eq([]))
    end
  end
  describe('initialize') do
    it('will initialize a customer and return their preferred breed') do
      customer_test = Customer.new({:id => nil, :name => 'Tedd', :phone => '919-555-1234', :species_pref => 'Dog', :breed_pref => 'Shitzu'})
      expect(customer_test.breed_pref).to(eq('Shitzu'))
    end
  end
  describe('#save') do
    it('will insert customer data into database') do
      customer_test = Customer.new({:id => nil, :name => 'Tedd', :phone => '919-555-1234', :species_pref => 'Dog', :breed_pref => 'Shitzu'})
      customer_test.save()
      expect(Customer.all()).to(eq([customer_test]))
    end
  end
  describe('#==') do
    it('will compare two instances with same description') do
      customer_test = Customer.new({:id => nil, :name => 'Tedd', :phone => '919-555-1234', :species_pref => 'Dog', :breed_pref => 'Shitzu'})
      customer_test2 = Customer.new({:id => nil, :name => 'Tedd', :phone => '919-555-1234', :species_pref => 'Dog', :breed_pref => 'Shitzu'})
      expect(customer_test).to(eq(customer_test2))
    end
  end

  describe('#list_by_breed') do
    it('will list all the customers and phones by breed preference') do
      customer_test = Customer.new({:id => nil, :name => 'Tedd', :phone => '919-555-1234', :species_pref => 'Dog', :breed_pref => 'Shitzu'})
      customer_test2 = Customer.new({:id => nil, :name => 'Fredd', :phone => '919-555-1234', :species_pref => 'Dog', :breed_pref => 'Labrador'})
      customer_test3 = Customer.new({:id => nil, :name => 'Ned', :phone => '919-555-1234', :species_pref => 'Dog', :breed_pref => 'Shitzu'})
      customer_test.save()
      customer_test2.save()
      customer_test3.save()
      expect(Customer.list_by_breed('Shitzu')).to(eq([customer_test, customer_test3]))
    end
  end
end
