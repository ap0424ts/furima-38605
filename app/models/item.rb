class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  validates :name, :content, :user_id, :image, presence: true
  validates :price, presence:true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to:9_999_999 }
  validates :area_id, :category_id, :charge_id, :condition_id, :day_id, numericality: { other_than: 1 } 
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area, :category, :charge, :condition, :day
end
