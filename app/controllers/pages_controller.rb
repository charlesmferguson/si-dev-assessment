class PagesController < ApplicationController
    
require "twilio-ruby"

def sms

    begin
        @client = Twilio::REST::Client.new ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_TOKEN"]
        message = @client.account.messages.create(:body => "Here's your sms!",
        :to => params[:q],
        :from => ENV["TWILIO_NUMBER"])  
    rescue Twilio::REST::RequestError => e
        puts e.message
    end 
end 
end