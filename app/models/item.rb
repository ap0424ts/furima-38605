class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area, :category, :charge, :condition, :day
  belongs_to :user
  has_one_attached :image

  validates :name, :content, :price, :user_id, presence: true
  validates :area_id, :category_id, :charge_id, :condition_id, :day_id, numericality: { other_than: 1 } 
end
