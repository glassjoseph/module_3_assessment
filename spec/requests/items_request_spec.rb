require 'rails_helper'


#
# When I send a GET request to `/api/v1/items`
# I receive a 200 JSON response containing all items
# And each item has an id, name, description, and image_url but not the created_at or updated_at
#


RSpec.describe "Items API" do
  it "can show a single item" do

    item = Item.create(name: "Book", description: "it's a good one", image_url: "this_url.com")
    # When I send a GET request to `/api/v1/items/1`

    get "/api/v1/items/1"

    expect(response).to be_success

    item = JSON.parse(response.body)


    # I receive a 200 JSON response containing the id, name, description, and image_url but not the created_at or updated_at
    expect(item).to have_key("id")
    expect(item).to have_key("name")
    expect(item).to have_key("description")
    expect(item).to have_key("image_url")
    expect(item).to_not have_key("created_at")
    expect(item).to_not have_key("updated_at")
  end

  it "can create an item" do

  item_params = {name: "Book", description: "it's a good one", image_url: "this_url.com"}

    post "/api/v1/items", {item: item_params}

    binding.pry
    expect(response.status).to eq(201)


    item = JSON.parse(response.body)

    expect(item).to have_key("id")
    expect(item).to have_key("name")
    expect(item).to have_key("description")
    expect(item).to have_key("image_url")
    expect(item).to_not have_key("created_at")
    expect(item).to_not have_key("updated_at")

    item = Item.last
    expect(item.name).to eq("Book")
    expect(item.description).to eq("it's a good one")
    expect(item.image_url).to eq("this_url.com")
  end
end



#
# When I send a DELETE request to `/api/v1/items/1`
# I receive a 204 JSON response if the record is successfully deleted
#
# When I send a POST request to `/api/v1/items` with a name, description, and image_url
# I receive a 201 JSON  response if the record is successfully created
# And I receive a JSON response containing the id, name, description, and image_url but not the created_at or updated_at
