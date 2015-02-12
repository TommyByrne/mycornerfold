  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    port:              '587',
    address:           'smtp.mailgun.org',
    user_name:         ENV['MAILGUN_SMTP_LOGIN'],
    password:          ENV['MAILGUN_SMTP_PASSWORD'],
    domain:            'tbyrne-blocmarks.herokuapp.com',
    authentication:    :plain,
    content_type:      'text/html'
  }

  ActionMailer::Base.raise_delivery_errors = true

class DevelopmentMailInterceptor
  def self.delivering_email(message)
    message.to  = 'tbyrn687@gmail.com'
    message.cc  = nil
    message.bcc = nil
  end
end

if Rails.env.development?
  ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor)
end