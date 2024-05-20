require 'net/smtp'

message = <<MESSAGE_END
From: Private Person <me@fromdomain.com>
To: A Test User <test@cpnv.ch>
Subject: SMTP e-mail test

This is a test e-mail message.
MESSAGE_END

Net::SMTP.start('localhost', 3325) do |smtp|
  smtp.send_message message, 'me@fromdomain.com', 'test@cpnv.ch'
end