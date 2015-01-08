class Pledge < ActiveRecord::Base
  validates :user_id, uniqueness: {scope: :birthday_id}
  validates :amount, numericality: true
  validates :amount, presence: true

  belongs_to :user
  belongs_to :birthday
end
