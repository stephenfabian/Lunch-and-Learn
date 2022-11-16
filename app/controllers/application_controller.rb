class ApplicationController < ActionController::API
  def valid_country?(country_name)
    if country_name == nil
      false
    else
      country = CountryNameService.country_data.find do |country|
      country[:name].downcase == country_name.downcase
      end
    end
    !country.nil?
  end
end
