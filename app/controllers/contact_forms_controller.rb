class ContactFormsController < ApplicationController

  def submit
    from = {
      :email => params[:contact_form][:email],
      :firstname => params[:contact_form][:firstname],
      :lastname => params[:contact_form][:lastname],
    }
    message = params[:contact_form][:message]
    recipients = ["charel@betacube.eu", "christian@betacube.eu", "georges@betacube.eu"]
    sent = recipients.select{|email| ContactFormMailer.submit(email, from, message).deliver}

    if sent.size == recipients.size
      flash[:success] = "Thank you for contacting us. We will reply to your message as soon as possible."
    else
      flash[:error] = "An eror occured while sending your message."
    end
    redirect_to "/contact"
  end

end