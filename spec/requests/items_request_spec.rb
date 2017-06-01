require 'rails_helper'


#
# When I send a GET request to `/api/v1/items`
# I receive a 200 JSON response containing all items
# And each item has an id, name, description, and image_url but not the created_at or updated_at
#


RSpec.describe "Items API" do
  it "can show a single item" do

    item = create(:item)
    # When I send a GET request to `/api/v1/items/1`

    get "/api/v1/items/1"

    expect(response).to be_success

    items = JSON.parse(response.body)
    item = item.first

    expect(items.count).to eq(Item.count)

    expect(items).to have_key("id")
    expect(items).to have_key("name")
    expect(items).to have_key("description")
    expect(items).to have_key("image_url")
    expect(items).to_not have_key("created_at")
    expect(items).to_not have_key("updated_at")

    # I receive a 200 JSON response containing the id, name, description, and image_url but not the created_at or updated_at
  end
end


#
# When I send a DELETE request to `/api/v1/items/1`
# I receive a 204 JSON response if the record is successfully deleted
#
# When I send a POST request to `/api/v1/items` with a name, description, and image_url
# I receive a 201 JSON  response if the record is successfully created
# And I receive a JSON response containing the id, name, description, and image_url but not the created_at or updated_at
