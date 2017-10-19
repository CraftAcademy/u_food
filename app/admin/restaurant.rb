ActiveAdmin.register Restaurant do

  permit_params :name, :address, :description, :latitude, :longitude, :restaurant_category, :admin_user

  before_create do |product|
    product.admin_user = current_admin_user
  end

  index do
    selectable_column
    id_column
    column :name, sortable: :name
    column :address, sortable: :address
    column :restaurant_category, sortable: :restaurant_category
    column :admin_user, sortable: :admin_user if authorized? :manage
    column :description, sortable: :description
    actions
  end

  filter :name
  filter :address
  filter :restaurant_category
  filter :admin_user, collection: proc {(AdminUser.all).map{|c| [c.email, c.id]}}, if: proc { authorized? :manage }
  filter :description

  form do |f|
    f.inputs do
      f.input :name
      f.input :address
      f.input :restaurant_category
      f.input :description
    end
    f.actions
  end
end
