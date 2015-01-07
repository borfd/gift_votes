class GiftIdea < ActiveRecord::Base
  validates :link, uniqueness: {scope: :birthday_id}
end
