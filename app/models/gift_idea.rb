class GiftIdea < ActiveRecord::Base
  validates :link, uniqueness: {scope: :birthday_id}
  belongs_to :birthday

  belongs_to :added_by, class_name: "User"
end
