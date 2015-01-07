class BirthdaysController < ApplicationController
  before_filter :authenticate_user!

  expose(:birthday, attributes: :birthday_params)
  expose(:pledge) { current_user.pledge_for_birthday(birthday) }

  def create
    if birthday.save
      redirect_to birthday
    else
      render :new
    end
  end

  private
    def birthday_params
      params.require(:birthday).permit(:id, :person, :day)
    end

end
