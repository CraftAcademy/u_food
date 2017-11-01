require 'rails_helper'

RSpec.describe 'Restaurant', type: :request do
  let(:headers) {{HTTP_ACCEPT: 'application/json'}}

  describe 'Get api/v1/restaurants' do
    let(:restaurant_category) {FactoryGirl.create(:restaurant_category,
                                                  name: 'Thai food',
                                                  description: 'Thai food',
                                                  id: 1)}
    let!(:restaurant) {FactoryGirl.create(:restaurant,
                                                name: 'My Thai',
                                                address: 'Kungsgatan 1, Stockholm',
                                                description: 'boring food',
                                                latitude: 59.3360777, longitude: 18.071807,
                                                id: 1,
                                                restaurant_category: restaurant_category)}
    let(:dish_category) {FactoryGirl.create(:dish_category,
                                            name: 'Main',
                                            id: 1)}
    let!(:menu) {FactoryGirl.create(:menu,
                                          name: 'Lunch',
                                          restaurant: restaurant,
                                          id: 1)}
    let!(:dish) {FactoryGirl.create(:dish,
                                          name: 'Dumplings',
                                          description: 'boring food',
                                          price: 10,
                                          id: 1,
                                          dish_category: dish_category,
                                          restaurant: restaurant)}
    let!(:menu_line) {FactoryGirl.create(:menu_line,
                                               dish: dish,
                                               menu: menu)}

    it 'returns collection of restaurants' do

      get '/api/v1/restaurants'

      expected_response = {"restaurants" =>
                               [{"id" => 1,
                                 "name" => "My Thai",
                                 "address" => "Kungsgatan 1, Stockholm",
                                 "description" => "boring food",
                                 "latitude" => 59.3360777,
                                 "longitude" => 18.071807,
                                 "category_name" => "Thai food",
                                 "category_description" => "Thai food"}]}


      expect(response.status).to eq 200
      expect(response_json).to eq expected_response
    end
  end

  describe 'Get api/v1/restaurants/:id' do

    it 'returns collection of dishes' do

      get '/api/v1/restaurants/1'

      expected_response = {"dishes" =>
                               [{"id" => 1,
                                 "name" => "Dumplings",
                                 "desription" => "boring food",
                                 "price" => 10,
                                 "image" => "https://goo.gl/images/hpTGCV",
                                 "menu" => "Lunch",
                                 "dish_category" => "Main",
                                 "restaurant" => "My Thai",
                                 "restaurant_category" => "Thai Food"}]}

      expect(response.status).to eq 200
      expect(response_json).to eq expected_response
    end
  end
end
