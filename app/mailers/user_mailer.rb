class UserMailer < ActionMailer::Base
  default from: 'tom_doido@hotmail.com'
 
  def access_email(current_user, joined_account)
    @user = current_user
    @employee = joined_account
    @url  = '/'
    mail(to: @user.email, subject: 'Hey, someone wants to join the account')
  end
end
