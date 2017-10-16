ActiveAdmin.register RestaurantCategory do

  actions :index, :show, :new, :create, :update, :edit
  permit_params :name, :description

  index do
      column :id
      column :name, sortable: :title
      column :description, sortable: :description
      column :created_at, sortable: :created_at
      column :updated_at, sortable: :updated_at

      binding.pry
      if current_user.admin?
        action
      else
        actions
      end
    end
end
