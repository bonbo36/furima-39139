class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :purchase_record

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery_area
  belongs_to :estimated_delivery_date
  belongs_to :shipping_charge
  belongs_to :status

  validates :image, presence: true
  validates :item_name, presence: true
  validates :description, presence: true
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :category_id, presence: true, numericality: { other_than: 1, message: "を入力してください。" }
  validates :delivery_area_id, presence: true, numericality: { other_than: 1, message: "を入力してください。" }
  validates :estimated_delivery_date_id, presence: true, numericality: { other_than: 1, message: "を入力してください。" }
  validates :shipping_charge_id, presence: true, numericality: { other_than: 1, message: "を入力してください。" }
  validates :status_id, presence: true, numericality: { other_than: 1, message: "を入力してください。" }
end
