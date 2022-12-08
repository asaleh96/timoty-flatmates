class Activity < ApplicationRecord
  belongs_to :household
  belongs_to :creator, class_name: 'User'
end
