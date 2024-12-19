# frozen_string_literal: true

class DummySmsGatewayService
  attr_reader :mobile_phone_number, :code

  def initialize(mobile_phone_number, code, context = {})
    @mobile_phone_number = mobile_phone_number
    @code = code
  end

  def deliver_code
    # Actual code to deliver the code
    true
  end
end
