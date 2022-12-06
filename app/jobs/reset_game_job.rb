class ResetGameJob < ApplicationJob
  queue_as :default

  def perform
    # Do something later
    User.all.each do |user|
      user.update(earned_points: 0)
    end
    Task.all.each(&:destroy)
  end
end
