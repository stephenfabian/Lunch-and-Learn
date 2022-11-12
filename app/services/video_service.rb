class VideoService
  def self.conn
    Faraday.new(
      url: 'https://www.googleapis.com/youtube/v3/search',
      params: { key: ENV['video_key'], part: "snippet", channelId: "UCluQ5yInbeAkkeCndNnUhpw" }
    )
  end

  def self.parse(api_data)
    JSON.parse(api_data.body, symbolize_names: true)
  end

  def self.video_search(country)
    response = conn.get("?q=#{country}")
    
    parse(response)
  end
end