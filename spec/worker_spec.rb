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
end
