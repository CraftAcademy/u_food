RSpec.describe Api::V1::RestaurantsController, type: :request do
  let(:user) { FactoryGirl.create(:user)}
  let(:credentials) { user.create_new_auth_token }
  let!(:dish) { FactoryGirl.create(:dish) }
  let(:headers) { { HTTP_ACCEPT: 'application/json' }.merge!(credentials) }

  describe 'POST /api/v1/restaurants' do
    it 'show cart items' do
      post '/api/v1/restaurants', params: {
        order: { dishes: [dish.id, dish.id] }
      }, headers: headers

      entry = Cart.last
      expect(entry.total_unique_items).to eq 2
      expected_response = {'cart' => {'id' => entry.id} }
      expect(response_json).to eq expected_response
      expect(entry.user_id).to eq user.id
    end

    it 'sends wrong data' do
      post '/api/v1/restaurants', params: {
          order: { dishes: ['hello', dish.id] }
      }, headers: headers

      expected_response = {'message' => 'wrong data received'}
      expect(response_json).to eq expected_response
    end

    context 'user not logged in' do
      let(:headers) { { HTTP_ACCEPT: 'application/json' }  }
      it 'not logged in' do
        post '/api/v1/restaurants', params: {
            order: { dishes: ['hello', dish.id] }
        }, headers: headers

        expected_response = {'errors' => ['You need to sign in or sign up before continuing.']}
        expect(response_json).to eq expected_response
      end
    end
  end
end
