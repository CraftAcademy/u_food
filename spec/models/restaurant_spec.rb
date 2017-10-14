require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  describe 'factory' do
    it 'is valid' do
      expect(FactoryGirl.create(:restaurant)).to be_valid
    end
  end

  describe 'DB table' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :name }
    it { is_expected.to have_db_column :address }
    it { is_expected.to have_db_column :description }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of :address }
  end

  describe 'associations' do
      it { is_expected.to belong_to(:restaurant_category) }
      it { is_expected.to have_many(:menus) }
  end
end
