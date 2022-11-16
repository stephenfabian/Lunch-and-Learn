class LearningResourceFacade 
  def self.video_details(country)
    video_data = LearningResourceService.video_search(country)
    if video_data[:items] == []
      return []
    else
      video = video_data[:items].first
      attributes_hash = {}
      attributes_hash[:title] = video[:snippet][:title]
      attributes_hash[:youtube_video_id] = video[:id][:videoId]
      attributes_hash
    end
  end

  def self.image_details(country)
    image_data = LearningResourceService.photo_search(country)
    image_data[:results].map do |image|
      image_attribute_hash = {}
      image_attribute_hash[:alt_tag] = image[:alt_description]
      image_attribute_hash[:url] = image[:urls][:full]
      image_attribute_hash
    end
  end
  
  def self.learning_resource_object(country)
    lr_attributes_hash = {}
    lr_attributes_hash[:country] = country
    lr_attributes_hash[:video] = video_details(country)
    lr_attributes_hash[:images] = image_details(country)
    LearningResource.new(lr_attributes_hash)
  end
end