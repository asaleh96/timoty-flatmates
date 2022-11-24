class Request < ApplicationRecord
  belongs_to :user, optional: true, foreign_key: "user_id"
  belongs_to :household, optional: true, foreign_key: "household_id"
end
