class CountryNameFacade < CountryNameService

  def self.random_country
    country_names_array = country_names_data.map do |country|
      country[:name]
    end
    country_names_array.sample
  end

  def self.capital_long_lat(country_name)
    country = country_data.find do |country|
      country[:name] == country_name
    end
    lat_long = country[:latlng]
    long_lat = lat_long.reverse
  end
end