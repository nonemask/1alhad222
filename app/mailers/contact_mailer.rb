class ContactMailer < ActionMailer::Base
  
  attr_accessor :name, :email, :message

  default to: "name@myapp.com",
          from: "contact@myapp.com"

  headers = {'Return-Path' => 'contact@myapp.com'}

  def send_email(user_info)
    @user_info = user_info

    mail(
      to: "name@myapp.com",
      subject: "MyApp's Contact Form",
      from: "MyApp <contact@myapp.com>",
      return_path: "contact@myapp.com",
      date: Time.now,
      content_type: "text/html"
    )
  end
end