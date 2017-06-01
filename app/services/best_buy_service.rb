class BestBuyService



  def self.search_by_zip(zip)
    raw_response = Faraday.get("https://api.bestbuy.com/v1/stores?format=json&show=city,longName,storeType,phone&apiKey=#{ENV['BEST_BUY_KEY']}&postalCode=#{zip}&distance=25")

    response = JSON.parse(raw_response.body, symbolize_names: true)

    response[:stores]
  end


end
