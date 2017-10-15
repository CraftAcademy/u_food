ActiveAdmin.register CartItem do

  permit_params :owner_id, :owner_type, :quantity, :item_id, :item_type, :price_cents, :price_currency

end
