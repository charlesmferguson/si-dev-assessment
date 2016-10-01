class PagesController < ApplicationController
    
require "twilio-ruby"

def sms
  
    begin
        @client = Twilio::REST::Client.new ENV["account_sid"], ENV["auth_token"]
        message = @client.account.messages.create(:body => "Here's your sms!",
        :to => params[:q],
        :from => ENV["number"])  
    rescue Twilio::REST::RequestError => e
        puts e.message
    end 
end 
end