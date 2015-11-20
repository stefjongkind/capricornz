# /config/initializers/mailer.rb
ActionMailer::Base.delivery_method = :sendmail
ActionMailer::Base.default_content_type = "text/html"
ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.capricornz.com',
  :port           => 25,
  :domain         => 'capricornz.com',
  :authentication => :login,
  :user_name      => 'waiatea2',
  :password       => 'Marama7142'
}