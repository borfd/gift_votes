class VotesController < ApplicationController

  expose(:birthday)
  expose(:gift_idea)
  expose(:vote, attributes: :votes_attributes)

  def create
    vote.birthday = birthday
    vote.gift_idea = gift_idea
    vote.user = current_user
    vote.save!

    redirect_to birthday
  end

  def destroy
    vote.destroy

    if current_user == vote.user
    end
    redirect_to birthday
  end

  private
    def votes_attributes
      params.permit(:birthday_id, :gift_idea_id)
    end

end
