class Task < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  belongs_to :assignee, class_name: 'User', optional: true
end
