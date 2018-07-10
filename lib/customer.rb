class Customer
  attr_reader(:id, :name, :phone, :species_pref, :breed_pref)

  def initialize(attr)
    @id = attr.fetch(:id)
    @name = attr.fetch(:name)
    @phone = attr.fetch(:phone)
    @species_pref = attr.fetch(:species_pref)
    @breed_pref = attr.fetch(:breed_pref)
  end

  def self.all
    returned_customers = DB.exec("SELECT * FROM customers;")
    customers = []
    returned_customers.each do |customer|
      id = customer.fetch("id").to_i
      name = customer.fetch("name")
      phone = customer.fetch("phone")
      species_pref = customer.fetch("species_pref")
      breed_pref = customer.fetch("breed_pref")
      customers.push(Customer.new({:id => id, :name => name, :phone => phone, :species_pref => species_pref, :breed_pref => breed_pref}))
    end
    customers
  end

  def save
    DB.exec("INSERT INTO customers (name, phone, species_pref, breed_pref) VALUES ('#{@name}', '#{@phone}', '#{@species_pref}', '#{@breed_pref}');")
  end

  def ==(another_customer)
    self.name.==(another_customer.name).&(self.phone.==(another_customer.phone)).&(self.species_pref.==(another_customer.species_pref)).&(self.breed_pref.==(another_customer.breed_pref))
  end

  def self.list_by_breed(breed)
    list_of_customers = DB.exec("SELECT * FROM customers WHERE breed_pref = '#{breed}';")
    customers = []
    list_of_customers.each do |customer|
      id = customer.fetch("id").to_i
      name = customer.fetch("name")
      phone = customer.fetch("phone")
      species_pref = customer.fetch("species_pref")
      breed_pref = customer.fetch("breed_pref")
      customers.push(Customer.new({:id => id, :name => name, :phone => phone, :species_pref => species_pref, :breed_pref => breed_pref}))
    end
    customers
  end
end
