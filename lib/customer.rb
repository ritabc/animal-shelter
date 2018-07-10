class Customer
  attr_reader(:id, :name, :phone, :species_pref, :breed_pref)

  def initialize(attr)
    @id = attr.fetch(:id)
    @name = attr.fetch(:name)
    @phone = attr.fetch(:phone)
    @species_pref = attr.fetch(:species_pref)
    @breed_pref = attr.fetch(:breed_pref)
  end
end
