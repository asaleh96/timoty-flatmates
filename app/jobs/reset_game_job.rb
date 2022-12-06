class ResetGameJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    puts "Resetting game"
  end
end
