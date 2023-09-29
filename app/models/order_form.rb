class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :prefecture_id, :city, :address_number, :building, :phone_number, :token

  with_options presence: true do

    # orderモデルのバリデーション
    validates :user_id
    validates :item_id

    # paymentモデルのバリデーション
    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :address_number
    validates :phone_number, format: { with: /\A[0-9]{11}\z/, message: 'is invalid' }

    # トークンのバリデーション
        validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    # ストロングパラメーターでデータが運ばれ、それらが保存のタイミングで「order_id」が生成され、保存される。
    Payment.create(order_id: order.id, postcode: postcode, prefecture_id: prefecture_id, city: city, address_number: address_number, building: building, phone_number: phone_number)
  end
end