require 'twilio-ruby'

puts "Who do you want to call?"
number = gets.chomp

puts "What do you want to say to them?"
message = gets.chomp

message.gsub!(/\s/,'+')

receiver = number
phone_number = '' # Twilio Account Phone Number
account_sid = '' # TWILIO ACCT SID
auth_token = '' # TWILIO AUTH TOKEN

client = Twilio::REST::Client.new account_sid, auth_token
client.account.calls.create(
	:from => phone_number,
	:to => receiver,
	:url => 'http://twimlets.com/echo?Twiml=%3CResponse%3E%3CSay%3E' + message + '%3C%2FSay%3E%3C%2FResponse%3E'
	)
