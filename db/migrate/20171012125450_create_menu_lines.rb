class CreateMenuLines < ActiveRecord::Migration[5.1]
  def change
    create_table :menu_lines do |t|

      t.timestamps
    end
  end
end
