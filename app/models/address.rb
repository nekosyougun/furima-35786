class Address < ApplicationRecord
  belongs_to :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  validates :category_id, :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

end