class UserMailer < ApplicationMailer
  def weekly_email(household)
    @household = household

    @topuser = @household.users.max_by { |user| Task.where(done: true, assignee: user).count }
    @topusercount = Task.where(done: true, assignee: @topuser).count

    @maxtask = Task.where(household_id: @household.id, done: true).max_by(&:points)
    @maxuser = @maxtask.assignee

    @fastuser = @household.users.sample

    @household.users.each do |user|
      @user = user
      mail(to: @user.email, subject: 'Weekly Timoty Update')
    end
  end
end
