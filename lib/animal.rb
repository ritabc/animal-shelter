class Animal
  attr_reader(:id, :name, :gender, :admittance_date, :species, :breed)
  attr_accessor(:customer_id)

  def initialize(attr)
    @id = attr.fetch(:id)
    @name = attr.fetch(:name)
    @gender = attr.fetch(:gender)
    @admittance_date = attr.fetch(:admittance_date).to_s
    @species = attr.fetch(:species)
    @breed = attr.fetch(:breed)
    @customer_id = "null"
  end

  def self.all()
    returned_animals = DB.exec("SELECT * FROM animals;")
    animals = []
    returned_animals.each do |animal|
      id = animal.fetch("id").to_i
      name = animal.fetch("name")
      gender = animal.fetch("gender")
      admittance_date = animal.fetch("admittance_date")
      species = animal.fetch("species")
      breed = animal.fetch("breed")
      customer_id = animal.fetch("customer_id").to_i
      animals.push(Animal.new({:id => id, :name => name, :gender => gender, :admittance_date => admittance_date, :species => species, :breed => breed, :customer_id => customer_id}))
    end
    animals
  end

  def save
    result = DB.exec("INSERT INTO animals (name, gender, admittance_date, species, breed, customer_id) VALUES ('#{@name}', '#{@gender}', '#{@admittance_date}', '#{@species}', '#{@breed}', #{@customer_id}) RETURNING id;")
    @id = result.first.fetch("id").to_i
  end

  def self.sort(sort_by)
    animals_to_sort = DB.exec("SELECT * FROM animals ORDER BY #{sort_by}")
    sorted_animals = []
    animals_to_sort.each do |animal|
      id = animal.fetch("id").to_i
      name = animal.fetch("name")
      gender = animal.fetch("gender")
      admittance_date = animal.fetch("admittance_date")
      species = animal.fetch("species")
      breed = animal.fetch("breed")
      customer_id = animal.fetch("customer_id").to_i
      sorted_animals.push(Animal.new({:id => id, :name => name, :gender => gender, :admittance_date => admittance_date, :species => species, :breed => breed, :customer_id => customer_id}))
    end
    sorted_animals
  end

  def ==(another_animal)
    self.name.==(another_animal.name).&(self.gender.==(another_animal.gender)).&(self.admittance_date.==(another_animal.admittance_date)).&(self.species.==(another_animal.species)).&(self.breed.==(another_animal.breed))
  end

end
