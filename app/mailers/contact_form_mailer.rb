class ContactFormMailer < ActionMailer::Base
  default to: "georges@betacube.eu"
  default from: "no-reply@betacube.eu"

  def submit(to, from, message)
    @from = from
    @message = message
    mail(:to => to, :subject => "Betacube.eu - Contact Form")
  end

end
