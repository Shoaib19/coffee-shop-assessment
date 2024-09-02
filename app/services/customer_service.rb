# frozen_string_literal: true

# service to create a new customer
class CustomerService
  def initialize(customer_attribs)
    @customer_attribs = customer_attribs
  end

  def call
    customer = Customer.find_or_initialize_by(email: customer_attribs[:email])
    if customer.name.nil?
      customer.name = customer_attribs['name']
      customer.phone = customer_attribs['phone']
    end
    begin
      customer.save!
      customer
    rescue ActiveRecord::RecordInvalid => e
      Rails.logger.error("Customer creation failed: #{e.message}")
      nil
    rescue StandardError => e
      Rails.logger.error("An unexpected error occurred: #{e.message}")
      nil
    end
  end

  private

  attr_reader :customer_attribs
end
