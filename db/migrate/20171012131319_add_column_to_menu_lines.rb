class AddColumnToMenuLines < ActiveRecord::Migration[5.1]
  def change
    add_column :menu_lines, :dish_id, :integer
    add_column :menu_lines, :menu_id, :integer
  end
end
