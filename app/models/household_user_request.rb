class HouseholdUserRequest < ApplicationRecord
  belongs_to :user
  belongs_to :household
end
