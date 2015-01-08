class GiftIdea < ActiveRecord::Base
  validates :link, uniqueness: {scope: :birthday_id}
  validates :link, :format => URI::regexp(%w(http https))
  validates :price, numericality: true

  belongs_to :birthday
  belongs_to :added_by, class_name: "User"
end
