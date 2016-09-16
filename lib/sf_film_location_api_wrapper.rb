require "sf_film_location_api_wrapper/version"
require "unirest"

module SfFilmLocationApiWrapper
  class FilmLocation
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
      array = Unirest.get("https://data.sfgov.org/resource/wwmu-gmzc.json").body
      # create(array)
      @film_locations = []
      array.each do |hash|
        @film_locations << FilmLocation.new(hash)
      end
      return @film_locations
    end

    def self.create(array)
      @film_locations = []
      array.each do |hash|
        p hash
        @film_locations << FilmLocation.new(hash)
      end
      return @film_locations
    end
  end
end
