class TouristSight
  attr_reader :id, :name, :address, :place_id

  def initialize(sights_attributes_hash)
    @id = nil
    @name = sights_attributes_hash[:name]
    @address = sights_attributes_hash[:address]
    @place_id = sights_attributes_hash[:place_id]
  end
end