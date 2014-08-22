class UserMailer < ActionMailer::Base
  default from: 'tom_doido@hotmail.com'
 
  def access_email(user)
    @user = user
    @url  = '/'
    mail(to: @user.email, subject: 'Hey, someone wants to join the account')
  end
end
