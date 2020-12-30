class DonationsController < ApplicationController
  def index
  end

  def new
    @user_donation = UserDonation.new
  end

  def create
    @user_donation = UserDonation.new(donation_params)   #「UserDonation」に編集
    if @user_donation.valid?
      @user_donation.save
      redirect_to action: :index
    else
      render action: :new
    end
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
