class Item < ApplicationRecord
<<<<<<< HEAD
  belongs_to :user
  belongs_to :category
  # belongs_to :brand
=======

  belongs_to :user
  belongs_to :category
  # belongs_to :brand
  has_many :images

  # has_many :comments
>>>>>>> master

end
