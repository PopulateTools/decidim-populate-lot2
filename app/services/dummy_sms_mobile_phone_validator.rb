# frozen_string_literal: true

class DummySmsMobilePhoneValidator < Decidim::Initiatives::ValidateMobilePhone
  def authorized? = true

  def phone_match? = true
end
