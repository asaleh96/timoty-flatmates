class ResetGameJob < ApplicationJob
  queue_as :default

  def perform
    # Do something later
    Household.all.each do |household|
      User.where(household_id: household.id).each do |user|
        user.update_attributes(points: 0)
      end
      Task.where(household_id: household.id).each do |task|
        task.destroy
      end
    end
  end
end
