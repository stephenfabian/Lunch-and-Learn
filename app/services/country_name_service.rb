class CountryNameService
  def self.country_names_data
    response = Faraday.get('https://restcountries.com/v2/all?fields=name')
    parse(response)
  end

  def self.parse(api_data)
    JSON.parse(api_data.body, symbolize_names: true)
  end
end