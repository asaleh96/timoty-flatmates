namespace :user do
  desc "Resets all users' earned points & deletes all tasks"
  task refresh_all: :environment do
    ResetGameJob.perform_later
  end
end
