class GiftIdeasController < ApplicationController

  expose(:birthday)
  expose(:gift_idea, attributes: :gift_idea_attributes)

  def create
    gift_idea.added_by = current_user
    gift_idea.birthday = birthday

    gift_idea.save
    redirect_to birthday
  end

  private
    def gift_idea_attributes
      params.require(:gift_idea).permit(:link, :birthday_id, :price)
    end

end
