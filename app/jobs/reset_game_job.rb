class ResetGameJob < ApplicationJob
  queue_as :default

  def perform
    # Do something later
    User.all.each do |user|
      user.update(earned_points: 0)
      user.save
    end
    Task.all.each(&:destroy)
  end
end
