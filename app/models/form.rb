class Form

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :delivery_area_id, :municipality, :address, :building_name, :room_number, :token
  
  with_options presence: true do
    validates :post_code,format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :delivery_area_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :municipality
    validates :address
    validates :room_number,format: {with:/\A\d{10,11}\z/,}
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(post_code: post_code, delivery_area_id: delivery_area_id, municipality: municipality, address: address, building_name: building_name, room_number: room_number, purchase_record_id: purchase_record.id)

  end
end