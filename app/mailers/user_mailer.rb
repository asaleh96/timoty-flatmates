class UserMailer < ApplicationMailer

  def weekly_email(household)
    @household = household
    # @household = params[:household]
    @household.users.each do |user|
      @user = user
      mail(to: @user.email, subject: 'Weekly Timoty Update')
    end
  end
end
