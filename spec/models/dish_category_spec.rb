require 'rails_helper'

RSpec.describe DishCategory, type: :model do
  describe 'factory' do
    it 'is valid' do
      expect(FactoryGirl.create(:dish_category)).to be_valid
    end
  end

  describe 'DB table' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :name }
  end
end
