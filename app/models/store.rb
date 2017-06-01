class Store
  attr_accessor :name, :city, :distance, :phone, :type

  def initialize(attrs = {})
    @name = attrs[:longName]
    @city = attrs[:city]
    @distance = "Within 25 miles"
    @phone = attrs[:phone]
    @type = attrs[:storeType]
  end

  def self.search_by_zip(zip)
    raw_stores = BestBuyService.search_by_zip(zip)

    raw_stores.map do |raw_store|
      Store.new(raw_store)
    end
  end



end
