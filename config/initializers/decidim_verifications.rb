# frozen_string_literal: true

Decidim::Verifications.register_workflow(:dummy_authorization_handler) do |workflow|
  workflow.form = "DummyAuthorizationHandler"
  workflow.action_authorizer = "DummyAuthorizationHandler::DummyActionAuthorizer"
  workflow.expires_in = 1.month
  workflow.renewable = true
  workflow.time_between_renewals = 5.minutes

  workflow.options do |options|
    options.attribute :allowed_postal_codes, type: :string, default: "08001", required: false
  end
end

Decidim::Verifications.register_workflow(:ephemeral_dummy_authorization_handler) do |workflow|
  workflow.ephemeral = true
  workflow.form = "EphemeralDummyAuthorizationHandler"
  workflow.action_authorizer = "DummyAuthorizationHandler::DummyActionAuthorizer"
  workflow.expires_in = 1.month
  workflow.renewable = true
  workflow.time_between_renewals = 5.minutes

  workflow.options do |options|
    options.attribute :allowed_postal_codes, type: :string, default: "05400", required: false
  end
end

Decidim::Verifications.register_workflow(:another_dummy_authorization_handler) do |workflow|
  workflow.form = "AnotherDummyAuthorizationHandler"
  workflow.expires_in = 1.month

  workflow.options do |options|
    options.attribute :passport_number, type: :string, required: false
  end
end
