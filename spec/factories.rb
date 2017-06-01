FactoryGirl.define do
  factory :store do
    name "MyString"
    city "MyString"
    distance "MyString"
    phone "MyString"
    type ""
  end

  factory :item do
    name "Item name"
    description "Sure is an item"
    image_url "url.com"
  end
end
