# frozen_string_literal: true

class DummySmsMobilePhoneForm < Decidim::Verifications::Sms::MobilePhoneForm
  def generated_code
    byebug
    "010203"
  end
end
