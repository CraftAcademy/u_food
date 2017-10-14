require 'rails_helper'

RSpec.describe MenuLine, type: :model do

  describe 'Associations' do
    it { is_expected.to belong_to :menu }
    it { is_expected.to belong_to :dish }
  end

  describe 'Factory' do
    it 'should be valid' do
      expect(FactoryGirl.create(:menu_line)).to be_valid
    end
  end
end