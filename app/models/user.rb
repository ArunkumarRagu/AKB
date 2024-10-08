class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :accounts
  has_many :transactions


  def self.current=(user)
    Thread.current[:current_user] = user
  end

  def self.current
    Thread.current[:current_user]
  end
end
