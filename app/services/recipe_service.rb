class RecipeService
  def self.conn
    Faraday.new(
      url: 'https://api.edamam.com/api/recipes/v2',
      params: { app_id: ENV['app_id'], app_key:ENV['app_key'] }
    )
  end

  def self.parse(api_data)
    JSON.parse(api_data.body, symbolize_names: true)
  end

  def self.recipe_data_by_country(country)
    response = conn.get("?type=public&q=#{country}")
    parse(response)
  end
end