# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@yourcoffeeshop.com'
  layout 'mailer'
end
