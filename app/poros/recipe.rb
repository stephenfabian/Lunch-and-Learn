class Recipe 
  attr_reader :title, :url, :image

  def initialize(attributes_hash)
    @title = attributes_hash[:label]
    @url = attributes_hash[:url]
    @image = attributes_hash[:image]
  end
end