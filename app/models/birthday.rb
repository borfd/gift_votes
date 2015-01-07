class Birthday < ActiveRecord::Base
  validates :person, presence: true
  validates :day, presence: true


  has_many :pledges

  def to_s
    "#{person} #{day}"
  end

  def plan
    @_gift_votes ||= GiftVotes::Plan.new.tap do |plan|
      pledges.pluck(:amount).map {|a| plan.pledge(a) }
    end
  end

  def state
    plan.current_state
  end

  def budget
    plan.budget.amount
  end
end
