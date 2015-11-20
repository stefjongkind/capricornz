class Notification < ActionMailer::Base
  
  def enquiry_notification(email, name, message)
    @message = message
    @name = name
    recipients 'info@capricornz.com'
    from email
    subject "Capricorn enquiry"
    sent_on Time.now
  end  
end