require 'rails_helper'


RSpec.describe do
  it "responds to all attributes" do


    store = Store.new(name: "this store", city: "Denver", distance: "25", phone: "555-555-5555", type: "Big Store")

    expect(store).to respond_to(:name)
    expect(store).to respond_to(:city)
    expect(store).to respond_to(:distance)
    expect(store).to respond_to(:phone)
    expect(store).to respond_to(:type)
  end
end
