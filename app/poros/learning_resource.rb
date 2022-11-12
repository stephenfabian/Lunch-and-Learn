class LearningResource
  attr_reader :id, :country, :video, :images

  def initialize(attributes_hash)
    @id = nil
    @country = attributes_hash[:country]
    @video = attributes_hash[:video]
    @images = attributes_hash[:images]
  end
end