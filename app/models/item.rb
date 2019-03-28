class Item < ApplicationRecord

  belongs_to :user
  belongs_to :category
  belongs_to :brand, optional: true
  has_many :images
  accepts_nested_attributes_for :images
  accepts_nested_attributes_for :brand

  # has_many :comments

end
