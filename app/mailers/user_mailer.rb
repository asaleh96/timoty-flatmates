class UserMailer < ApplicationMailer
  default from: 'notifications@timotyapp.com'

  def welcome_email
    @user = params[:user]
    @url  = 'http://timotyapp.com/login'
    mail(to: @user.email, subject: 'Welcome to Timoty!')
  end
end
