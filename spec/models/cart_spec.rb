require 'rails_helper'

RSpec.describe Cart, type: :model do
  describe 'factory' do
    it 'is valid' do
      expect(FactoryGirl.create(:cart)).to be_valid
    end
  end

  describe 'DB table' do
    it { is_expected.to have_db_column :id }
  end

  context `validations` do
    it {is_expected.to belong_to(:user)}
  end
end
