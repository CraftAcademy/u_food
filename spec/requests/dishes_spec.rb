require 'rails_helper'

RSpec.describe 'Dish', type: :request do
  let(:headers) {{HTTP_ACCEPT: 'application/json'}}

  describe 'Get api/v1/dishes' do
    let!(:restaurant) {FactoryGirl.create(:restaurant, name: 'My Thai', address: 'street 1', description: 'boring food', latitude: 33.7353997, longitude: 73.0781967, id: 1)}
    let(:dish_category) {FactoryGirl.create(:dish_category, name: 'Main', id: 1)}
    let!(:dish) {FactoryGirl.create(:dish, name: 'Dumplings', description: 'boring food', price: 10, pic_url: 'https://goo.gl/images/hpTGCV', id: 1, dish_category_id: dish_category.id, restaurant_id: restaurant.id)}

    it 'returns collection of dishes' do

      get '/api/v1/dishes'

      expected_response = {"dishes" =>
                            [{"id" => 1,
                             "name" => "Dumplings",
                             "desription" => "boring food",
                             "price" => 10,
                             "pic_url" => "https://goo.gl/images/hpTGCV",
                             "dish_category" => "Main",
                             "restaurant" => "My Thai"}]}

      expect(response.status).to eq 200
      expect(response_json).to eq expected_response
    end
  end
end