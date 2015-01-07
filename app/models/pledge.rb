class Pledge < ActiveRecord::Base
  validates :user_id, uniqueness: {scope: :birthday_id}
  belongs_to :user
  belongs_to :birthday
end
