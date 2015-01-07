class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def pledge_for_birthday(birthday)
    Pledge.where('birthday_id = ? and user_id = ?', birthday.id, id).first
  end

  def vote_for_gift_idea(gift_idea)
    Vote.where('gift_idea_id = ? and user_id = ? and birthday_id = ?', gift_idea.id, id, gift_idea.birthday.id).first
  end

  def has_voted?(birthday)
    Vote.where('birthday_id = ? and user_id = ?', birthday.id, id).any?
  end

  def to_s
    email
  end
end
