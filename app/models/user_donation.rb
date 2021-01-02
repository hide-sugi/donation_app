class UserDonation
  include ActiveModel::Model
  attr_accessor :name, :name_reading, :nickname, :postal_code, :prefecture, :city, :house_number, :building_name, :price
  with_options presence: true do
    validates :name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :name_reading, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."}
    validates :nickname, format: { with: /\A[a-z0-9]+\z/i, message: "is invalid. Input half-width characters."}
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :price, numericality: {only_integer: true, message: "is invalid. Input half-width characters."}
  end
  validates :prefecture, numericality: { other_than: 0, message: "can't be blank" }
  validates :price, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 1000000, message: "is out of setting range"}

  def save
    user = User.create(name: name, name_reading: name_reading, nickname: nickname)
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name, user_id: user.id)
    Donation.create(price: price, user_id: user.id)
  end
end