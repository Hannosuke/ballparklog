class ApplicationMailer < ActionMailer::Base
  default from: credentials[:GMAIL_ADDRESS]
end
