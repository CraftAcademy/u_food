class AddSuperAdminToAdminUser < ActiveRecord::Migration[5.1]
  def change
    add_column :admin_users, :super_admin, :boolean, default: false
  end
end
