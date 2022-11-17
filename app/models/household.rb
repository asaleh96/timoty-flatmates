class Household < ApplicationRecord
  has_many :users
  belongs_to :captain, class_name: 'User'
end
