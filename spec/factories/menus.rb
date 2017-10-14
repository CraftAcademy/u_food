FactoryGirl.define do
  factory :menu do
    name "MyString"

    factory :menu_with_menu_lines do
      name "MyString"

      after(:create) do |menu, evaluator|
        menu_line = FactoryGirl.create(:menu_line)
        dish = FactoryGirl.create(:dish_with_category)
        menu.menu_lines << menu_line
        menu.dishes << dish
      end
    end
  end
end
