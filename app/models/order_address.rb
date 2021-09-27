class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :city, :house_number, :telephone_number, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city, :house_number
    validates :telephone_number, format: { with: /\A\d{10,11}\z/ }
    validates :user_id
    validates :item_id
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, telephone_number: telephone_number, order_id: order_id)
  end
end