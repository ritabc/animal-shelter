class Worker
  attr_reader(:id)
  attr_accessor(:animal_id, :customer_id)

  def initialize(attr)
    @id = attr.fetch(:id)
    @animal_id = "null"
    @customer_id = "null"
  end

  def self.assign_customer(animal_obj, customer_obj)
    animal_obj.customer_id = customer_obj.id
  end
end
