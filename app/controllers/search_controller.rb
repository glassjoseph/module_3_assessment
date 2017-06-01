class SearchController < ApplicationController


  def index
    binding.pry

    # @conn = Faraday.new("https://api.bestbuy.com/v1")

    # @conn.get("/stores?format=json&show=city,longName,storeType,phone&apiKey=#{ENV['BEST_BUY_KEY']}&postalCode=80202&distance=25")

    # Faraday.get("https://api.bestbuy.com/v1/stores?format=json&show=city,longName,storeType,phone&apiKey=#{ENV['BEST_BUY_KEY']&&postalCode=80202&distance=25")

    Faraday.get("https://api.bestbuy.com/v1/stores?format=json&show=city,longName,storeType,phone&apiKey=zvkqfuc5vws6ytvedk2qwf4n&postalCode=80202&distance=25")
  end


end
