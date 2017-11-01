FactoryGirl.define do
  factory :dish do
    name 'DishName'
    description 'DishDescription'
    price 10
    image { File.new("#{Rails.root}/spec/fixtures/kfc.jpeg") }

    factory :dish_with_category do
      dish_category
    end

  end
end
