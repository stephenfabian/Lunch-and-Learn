class Recipe 
  attr_reader :id, :title, :url, :image

  def initialize(attributes_hash)
    @id = nil
    @title = attributes_hash[:label]
    @url = attributes_hash[:url]
    @image = attributes_hash[:image]
  end
end