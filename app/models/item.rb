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
    validates :name, :introduction, :price, :user
  end
  validates :price, format: { with: /\A[0-9]+\z/ }
  validates :category_id, :prefecture_id, :item_condition_id, :delivery_cost_id, :days_to_ship_id,  numericality: { other_than: 1 , message: "can't be blank"}
end
