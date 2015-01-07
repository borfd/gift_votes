class PledgesController < ApplicationController

  expose(:pledge, attributes: :pledge_params)
  expose(:birthday)

  def create
    pledge.user = current_user
    pledge.birthday = birthday
    pledge.save!

    redirect_to birthday
  end

  def update
    pledge.save!

    redirect_to birthday
  end

  private
    def pledge_params
      params.require(:pledge).permit(:amount, :birthday_id)
    end

end
