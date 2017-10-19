class AddPicUrlToRestaurant < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :pic_url, :string
  end
end
