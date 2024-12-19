# frozen_string_literal: true

class DummySmsMobilePhoneForm < Decidim::Verifications::Sms::MobilePhoneForm
  def generated_code
    "010203"
  end
end
