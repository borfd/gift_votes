class Birthday < ActiveRecord::Base
  validates :person, presence: true
  validates :day, presence: true
end
