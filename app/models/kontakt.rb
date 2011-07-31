class Kontakt < ActionMailer::Base
  
  def send_email_to_me(from, subject, body)
    content_type 'text/plain'
    recipients "famousbartus@gmail.com"
    bcc        "famousbartus@gmail.com"
    subject    from + " : " + subject
    body       body
    sent_on    Time.now
   end
end
