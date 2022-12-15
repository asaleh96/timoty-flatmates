class Activity < ApplicationRecord
  belongs_to :household
  belongs_to :user, class_name: 'User'
end
