class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #has_many :tasks, foreign_key: :creator_id
  #has_many :tasks, foreign_key: :assignee_id
  has_one :household
end
