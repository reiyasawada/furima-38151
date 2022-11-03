class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  # テーブルとのアソシエーション
  belongs_to :user
  has_one    :order

  # アクティブハッシュとのアソシエーション
  belongs_to :category
  belongs_to :prefecture
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :arrival_day

  # active_storageとのアソシエーション
  # （items・active_storage_blobsテーブルを関連付け）
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :category_id
    validates :condition_id
    validates :delivery_charge_id
    validates :prefecture_id
    validates :arrival_day_id
    # 300円以上かつ9,999,999円以下で、半角数字でないと入力不可
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  # ジャンルの選択が「--」の時は保存不可
  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :prefecture_id
    validates :condition_id
    validates :delivery_charge_id
    validates :arrival_day_id
  end
end
