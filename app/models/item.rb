class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_conditon
  belongs_to :prefecture
  belongs_to :delivery_cost
  belongs_to :days_to_ship

  with_options presence: true do
    validates :category, :prefecture, :item_condition, :days_to_ship, :delivery_cost, :introduction
  end

  validates :category_id, :prefecture_id, :item_condition_id, :delivery_cost, :days_to_ship_id,  numericality: { other_than: 1 , message: "can't be blank"}
end
