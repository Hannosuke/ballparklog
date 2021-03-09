class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.credentials[:GMAIL_ADDRESS]
end
