require "sf_film_location_api_wrapper/version"
require "unirest"

module SfFilmLocationApiWrapper
  class Film_Location
    attr_reader :title, :release_year, :locations, :fun_facts, :production_company, :distributor, :director, :writer

    def intialize(hash)
      @title = hash["title"]
      @release_year = hash["release_year"]
      @locations = hash["locations"]
      @fun_facts = hash["fun_facts"]
      @production_company = hash["production_company"]
      @distributor = hash["distributor"]
      @director = hash["director"]
      @writer = hash["writer"]
    end

    def self.all
      film_location_array = Unirest.get("https://data.sfgov.org/resource/wwmu-gmzc.json").body
      create_film_locations(film_location_array)
    end

    def self.create_film_locations(array)
      array.each do |film_location_api|
        FilmLocation.new(film_location_api)
      end
    end
  end
end
