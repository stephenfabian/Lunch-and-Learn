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
    coordinates(country)
  end

  def self.coordinates(country_hash)
    lat_long = country_hash[:latlng]
    long_lat = lat_long.reverse
  end

  def self.valid_country?(country_name)
     country = country_data.find do |country|
      country[:name] == country_name
    end
    !country.nil?
  end
end