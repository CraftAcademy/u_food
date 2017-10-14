FactoryGirl.define do
  factory :dish do
    name 'DishName'
    description 'DishDescription'
    price 10
    pic_url 'https://goo.gl/images/hpTGCV'

    factory :dish_with_category do
      dish_category
    end

  end
end
