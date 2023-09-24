class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user

  # ActiveHashとのアソシエーション
  belongs_to :category
  belongs_to :quality
  belongs_to :prefecture
  belongs_to :shipping_fee
  belongs_to :shipping_date

  # active_storageとのアソシエーション
  has_one_attached :image

  # 以下の項目が空では保存不可
  with_options presence: true do
    validates :image
    validates :title
    validates :detail
    validates :category_id
    validates :quality_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :shipping_date_id
    # 300円以上かつ9,999,999円以下で、半角数字でないと入力不可
    validates :price, numericality: {
      only_integer:true,
      greater_than_or_equal_to: 300,
      less_than_or_equal_to: 9_999_999
      }
  end

  # 選択が「---」では保存不可
  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :quality_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :shipping_date_id
  end

end
