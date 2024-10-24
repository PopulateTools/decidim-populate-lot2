# frozen_string_literal: true

class EphemeralDummyAuthorizationHandler < DummyAuthorizationHandler
  def to_partial_path
    "dummy_authorization/form"
  end
end
