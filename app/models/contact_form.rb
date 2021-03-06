class ContactForm < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i


  attribute :message
  attribute :nickname,  :captcha  => true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.

  def headers
    binding.pry
    {
      :subject => "My Contact Form",
      :to => "#{params[:id].email}",
      :from => %("#{name}" <#{email}>)
    }
  end
end