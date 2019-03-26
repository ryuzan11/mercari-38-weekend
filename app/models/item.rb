class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :brand
  has_many :images
  accepts_nested_attributes_for :images

  # has_many :comments

end
