class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def pledge_for_birthday(birthday)
    Pledge.where('birthday_id = ? and user_id = ?', birthday.id, id).first
  end

  def to_s
    email
  end
end
