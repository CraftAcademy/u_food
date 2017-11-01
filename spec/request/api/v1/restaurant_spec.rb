require 'rails_helper'

RSpec.describe 'Restaurant', type: :request do
  let(:headers) {{HTTP_ACCEPT: 'application/json'}}

  let!(:restaurant_category) {FactoryGirl.create(:restaurant_category,
                                                 name: 'Thai food',
                                                 description: 'Thai food')}
  let!(:restaurant) {FactoryGirl.create(:restaurant,
                                        name: 'My Thai',
                                        address: 'Kungsgatan 1, Stockholm',
                                        description: 'boring food',
                                        latitude: 59.3360777, longitude: 18.071807,
                                        restaurant_category: restaurant_category)}
  let!(:dish_category) {FactoryGirl.create(:dish_category,
                                           name: 'Main')}
  let!(:menu) {FactoryGirl.create(:menu,
                                  name: 'Lunch',
                                  restaurant: restaurant)}
  let!(:dish) {FactoryGirl.create(:dish,
                                  name: 'Dumplings',
                                  description: 'boring food',
                                  price: 10,
                                  dish_category: dish_category,
                                  restaurant: restaurant)}
  let!(:menu_line) {FactoryGirl.create(:menu_line,
                                       dish: dish,
                                       menu: menu)}

  describe 'Get api/v1/restaurants' do

    it 'returns collection of restaurants' do

      get '/api/v1/restaurants'

      expected_response = {'restaurants' =>
                               [{'id' => restaurant.id,
                                 'name' => 'My Thai',
                                 'address' => 'Kungsgatan 1, Stockholm',
                                 'description' => 'boring food',
                                 'latitude' => 59.3360777,
                                 'longitude' => 18.071807,
                                 'category_name' => 'Thai food',
                                 'category_description' => 'Thai food'}]}


      expect(response.status).to eq 200
      expect(response_json).to eq expected_response
    end
  end

  describe 'Get api/v1/restaurants/:id' do

    it 'returns collection of dishes' do

      get "/api/v1/restaurants/#{restaurant.id}"

      expected_response = {"restaurant" =>
                               {"id"=>restaurant.id,
                                "name"=>"My Thai",
                                "restaurant_category"=>"Thai food",
                                "menu"=>
                                    [{"id"=>menu.id,
                                      "name"=>"Lunch",
                                      "dishes"=>
                                          [{"id"=>dish.id,
                                            "name"=>"Dumplings",
                                            "description"=>"boring food",
                                            "price"=>10,
                                            "image"=>dish.image.url,
                                            "dish_category"=>"Main"}]}]}}



          expect(response.status).to eq 200
                           expect(response_json).to eq expected_response
    end
  end
end
