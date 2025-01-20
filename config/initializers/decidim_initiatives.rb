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
