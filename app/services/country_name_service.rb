class CountryNameService
  def self.country_data
    response = Faraday.get('https://restcountries.com/v3.1/all')
    parse(response)
  end

  def self.parse(api_data)
    JSON.parse(api_data.body, symbolize_names: true)
  end
end