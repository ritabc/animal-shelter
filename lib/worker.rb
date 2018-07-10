class Worker
  attr_reader(:id)

  def initialize(attr)
    @id = attr.fetch(:id)
  end
end
