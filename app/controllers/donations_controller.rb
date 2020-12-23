class DonationsController < ApplicationController
  def index
  end

  def new
  end

  def create
    user = User.create(user_params)
    Address.create(address_params(user))
    Donation.create(donation_params(user))
    redirect_to action: :index
  end

  private

  def user_params
    params.permit(:name, :name_reading, :nickname)
  end

  def address_params(user)
    params.permit(:postal_code, :prefecture, :city, :house_number, :building_name).merge(user_id: user.id)
  end

  def donation_params(user)
    params.permit(:price).merge(user_id: user.id)
  end
end
