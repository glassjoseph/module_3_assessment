class Store < ActiveRecord::Base

  def initialize(attrs = {})
    @name = attrs[:longName]
    @city = attrs[:city]
    @distance = "Within 25 miles"
    @phone = attrs[:phone]
    @type = attrs[:storeType]
  end
  #
  # def search_by_zip()
  #
  # end



end
