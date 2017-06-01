class SearchController < ApplicationController


  def index
    # @conn = Faraday.new("https://api.bestbuy.com/v1")

    # @conn.get("/stores?format=json&show=city,longName,storeType,phone&apiKey=#{ENV['BEST_BUY_KEY']}&postalCode=80202&distance=25")

    # Faraday.get("https://api.bestbuy.com/v1/stores?format=json&show=city,longName,storeType,phone&apiKey=#{ENV['BEST_BUY_KEY']&&postalCode=80202&distance=25")

    raw_response = Faraday.get("https://api.bestbuy.com/v1/stores?format=json&show=city,longName,storeType,phone&apiKey=zvkqfuc5vws6ytvedk2qwf4n&postalCode=80202&distance=25")
    response = JSON.parse(raw_response.body, symbolize_names: true)

    @stores = response[:stores].map do |raw_store|
      Store.new(raw_store)
    end

  end


end
