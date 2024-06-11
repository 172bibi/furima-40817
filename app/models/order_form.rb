class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :region_id, :municipalities, :streetaddress, :buildingname, :phonenumber

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :region_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :municipalities
    validates :streetaddress
    validates :phonenumber, format: { with: /\A\d{10,11}\z/, message: "is invalid. Don't include hyphen(-)"}
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postcode: postcode, region_id: region_id, municipalities: municipalities, streetaddress: streetaddress, buildingname: buildingname, phonenumber: phonenumber, order_id: order.id)
  end

end