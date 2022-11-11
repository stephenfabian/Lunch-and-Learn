class CountryNameFacade < CountryNameService

  def self.random_country
    country_names_array = country_names_data.map do |country|
      country[:name]
    end
    country_names_array.sample
  end
end