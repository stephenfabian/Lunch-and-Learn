class Recipe 
  attr_reader :id, :title, :url, :country, :image

  def initialize(attributes_hash)
    @id = nil
    @title = attributes_hash[:label]
    @url = attributes_hash[:url]
    @country = attributes_hash[:country]
    @image = attributes_hash[:image]
  end
end