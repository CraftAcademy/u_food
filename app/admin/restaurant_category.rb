ActiveAdmin.register RestaurantCategory do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  actions :index, :show, :new, :create, :update, :edit
  permit_params :name, :description
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin_features?
#   permitted
# end

  index do
      column :id
      column :name, sortable: :title
      column :description, sortable: :description
      column :created_at, sortable: :created_at
      column :updated_at, sortable: :updated_at
      actions
    end
end
