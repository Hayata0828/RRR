class Product < ApplicationRecord
  has_one :product_image
  has_many :users
  belongs_to :admin
  has_many :orders

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :category, presence: true

  attachment :image_main
  attachment :image_sub1
  attachment :image_sub2
end