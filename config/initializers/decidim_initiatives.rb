# frozen_string_literal: true

Decidim::Initiatives::Signatures.register_workflow(:dummy_signature_handler) do |workflow|
  workflow.form = "DummySignatureHandler"
  workflow.authorization_handler_form = "DummyAuthorizationHandler"
  workflow.action_authorizer = "DummySignatureHandler::DummySignatureActionAuthorizer"
  workflow.sms_verification = true
  workflow.sms_mobile_phone_validator = "DummySmsMobilePhoneValidator"
  workflow.sms_mobile_phone_form = "DummySmsMobilePhoneForm"
end

Decidim::Initiatives::Signatures.register_workflow(:dummy_signature_with_sms_handler) do |workflow|
  workflow.form = "Decidim::Initiatives::SignatureHandler"
  workflow.sms_verification = true
  workflow.sms_mobile_phone_form = "DummySmsMobilePhoneForm"
end

Decidim::Initiatives::Signatures.register_workflow(:dummy_signature_with_personal_data_handler) do |workflow|
  workflow.form = "DummySignatureHandler"
  workflow.authorization_handler_form = "DummyAuthorizationHandler"
  workflow.action_authorizer = "DummySignatureHandler::DummySignatureActionAuthorizer"
end

Decidim::Initiatives::Signatures.register_workflow(:dummy_signature_with_personal_data_and_previous_authorization_handler) do |workflow|
  workflow.form = "DummySignatureHandler"
  workflow.authorization_handler_form = "DummyAuthorizationHandler"
  workflow.action_authorizer = "DummySignatureHandler::DummySignatureActionAuthorizer"
  workflow.promote_authorization_validation_errors = true
  workflow.save_authorizations = false
end

# Flow that reproduces the old signature feature. Change the following options
# to adapt to the configuration
Decidim::Initiatives::Signatures.register_workflow(:legacy_signature_handler) do |workflow|
  # Enable this form to enable the same user data collection and store the same
  # fields in the vote metadata when the "Collect participant personal data on
  # signature" were checked
  workflow.form = "Decidim::Initiatives::LegacySignatureHandler"

  # Change this form and use the same handler selected in the "Authorization to
  # verify document number on signatures" field
  workflow.authorization_handler_form = "DummyAuthorizationHandler"

  # This setting prevents the automatic creation of authorizations as in the
  # old feature. You can remove this setting if the workflow does not use an
  # authorization hanlder form
  workflow.save_authorizations = false

  # Set this setting to false to skip SMS verification step
  workflow.sms_verification = true
end
