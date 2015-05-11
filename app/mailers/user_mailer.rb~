class UserMailer < ActionMailer::Base   
  default :from => "engy.elmoshrify@gmail.com" # if from is not specified it will be set as from.
  def welcome_email(user_info)
    email = user_info[:mail]
   
    mail(:to => email, :subject => "Welcome message")
  end
end
