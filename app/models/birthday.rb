class Birthday < ActiveRecord::Base
  validates :person, presence: true
  validates :day, presence: true

  has_many :pledges
  has_many :gift_ideas

  def to_s
    "#{person} #{day}"
  end

  def plan
    @_gift_votes ||= GiftVotes::Plan.new.tap do |plan|
      pledges.pluck(:amount).map {|a| plan.pledge(a) }
      gift_ideas.map {|idea| plan.add_gift_idea(idea)}
    end
  end

  def state
    plan.current_state
  end

  def budget
    plan.budget.amount
  end
end
