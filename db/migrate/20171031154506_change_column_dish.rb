class ChangeColumnDish < ActiveRecord::Migration[5.1]
  def self.up
    if column_exists? :dishes, :pic_url
      remove_column :dishes, :pic_url
    end
    change_table :dishes do |t|
      t.attachment :image
    end
  end
end
