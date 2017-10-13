class Cart < ApplicationRecord
  acts_as_shopping_cart_using :cart_item
  belongs_to :user

  def tax_pct
    0
  end
end
