require 'rspec'
require 'customer'
require 'pry'
require 'spec_helper'


describe('Customer') do
  describe('initialize') do
    it('will initialize a customer and return their preferred breed') do
      customer_test = Customer.new({:id => nil, :name => 'Tedd', :phone => '919-555-1234', :species_pref => 'Dog', :breed_pref => 'Shitzu'})
      expect(customer_test.breed_pref).to(eq('Shitzu'))
    end
  end
end
