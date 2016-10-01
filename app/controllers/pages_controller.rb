class PagesController < ApplicationController
    
require "twilio-ruby"

def sms
  
# account_sid = "AC97933738ad5d8fac72da857a2043bdd2"  
# auth_token = "8549d12985b7d27e0846364977c31a0c"

    begin
        @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
        message = @client.account.messages.create(:body => "Here's your sms!",
        :to => params[:q],
        :from => ENV['TWILIO_NUMBER'])  
    rescue Twilio::REST::RequestError => e
        puts e.message
    end 
end 
end