class Birthday < ActiveRecord::Base
  validates :person, presence: true
  validates :day, presence: true

  has_many :pledges
  has_many :gift_ideas
  has_many :votes

  def to_s
    "#{person} #{day}"
  end

  def plan
    @_plan ||= GiftVotes::Plan.new.tap do |plan|
      pledges.pluck(:amount).map {|a|    plan.pledge(a)            }
      gift_ideas            .map {|idea| plan.add_gift_idea(idea)  }
      votes                 .map {|vote| plan.vote(vote.gift_idea) }
    end
  end

  def state
    plan.current_state
  end

  def budget
    plan.budget.amount
  end

  def scores
    plan.scores
  end
end
