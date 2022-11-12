class LearningResourceService
  def self.image_conn
    Faraday.new(
      url: 'https://api.unsplash.com/search/photos',
      params: { client_id: ENV['image_access_key'], client_secret: ENV['image_secret_key'] }
    )
  end

  def self.video_conn
    Faraday.new(
      url: 'https://www.googleapis.com/youtube/v3/search',
      params: { key: ENV['video_key'], part: "snippet", channelId: "UCluQ5yInbeAkkeCndNnUhpw" }
    )
  end

  def self.parse(api_data)
    JSON.parse(api_data.body, symbolize_names: true)
  end

  def self.photo_search_data(country)
    response = image_conn.get("?query=#{country}&per_page=10")
    parse(response)
  end

  def self.video_search(country)
    response = video_conn.get("?q=#{country}&maxResults=1")
    parse(response)
  end
end