require 'rails_helper'

RSpec.describe AdminUser, type: :model do
  describe 'factory' do
    it 'is valid' do
      expect(FactoryGirl.create(:admin_user)).to be_valid
    end
  end

  describe 'DB table' do
    it {is_expected.to have_db_column :id}
    it {is_expected.to have_db_column :email}
    it {is_expected.to have_db_column :encrypted_password}
    it {is_expected.to have_db_column :super_admin}
  end

  describe 'associations' do
    it { is_expected.to have_many(:restaurants) }
  end

  describe 'Admin user' do
    describe 'abilities' do
      let(:admin) {nil}

      context 'when is an super admin' do
        let(:admin) {FactoryGirl.create(:admin_user)}
        subject(:ability) {Ability.new(admin)}

        it 'can manage all' do
          expect(ability.can?(:manage, :all)).to eq true
        end
      end

      context 'when is an restaurant owner' do
        let(:admin) {FactoryGirl.create(:admin_user, super_admin: false)}
        subject(:ability) {Ability.new(admin)}

        it 'can read all' do
          expect(ability.can?(:manage, Restaurant, admin_user: admin)).to eq true
        end

        it 'can not manage all' do
          expect(ability.can?(:manage, :all)).to eq false
        end
      end
    end
  end
end