class Item < ApplicationRecord
  belongs_to :seller_id
  belongs_to :buyer_id
  belongs_to :category_id
  belongs_to :brand_id

end
