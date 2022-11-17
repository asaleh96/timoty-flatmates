class Household < ApplicationRecord
  has_many :users
  has_many :rules
  belongs_to :captain, class_name: 'User'
end
