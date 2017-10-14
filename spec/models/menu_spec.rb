require 'rails_helper'

RSpec.describe Menu, type: :model do
  describe 'DB table' do
    it { is_expected.to have_db_column :name }
  end

  context `validations` do
    it { is_expected.to belong_to(:restaurant) }
  end
end