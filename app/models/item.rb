class Item < ApplicationRecord
  belongs_to :seller
  belongs_to :buyer
  belongs_to :category
  belongs_to :brand
  belongs_to :user

end
