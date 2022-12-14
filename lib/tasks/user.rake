namespace :user do
  desc "Resets all users' earned points & deletes all tasks"
  task refresh_all: :environment do
    Household.all.each do |household|
      UserMailer.weekly_email(household).deliver_later
    end
    ResetGameJob.perform_later
  end
end
