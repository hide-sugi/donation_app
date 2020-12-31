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

  def donation_params
    params.require(:user_donation).permit(:name, :name_reading, :nickname, :postal_code, :prefecture, :city, :house_number, :building_name, :price)
  end

end