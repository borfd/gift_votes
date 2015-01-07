class Pledge < ActiveRecord::Base
  validates :user_id, uniqueness: {scope: :birthday_id}
end
