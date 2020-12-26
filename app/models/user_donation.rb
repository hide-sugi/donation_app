class UserDonation
  include ActiveModel::Model
  attr_accessor :name, :name_reading, :nickname, :postal_code, :prefecture, :city, :house_number, :building_name, :price
  with_options presence: true do
    validates :name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :name_reading, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."}
    validates :nickname, format: { with: /\A[a-z0-9]+\z/i, message: "is invalid. Input half-width characters."}
  end
end