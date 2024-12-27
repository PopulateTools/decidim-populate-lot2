# frozen_string_literal: true

# An example authorization handler used so that users can be verified against
# third party systems.
#
# You should probably rename this class and file to match your needs.
#
# If you need a custom form to be rendered, you can create a file matching the
# class name named "_form".
#
# Example:
#
#   A handler named Decidim::CensusHandler would look for its partial in:
#   decidim/census/form
#
# When testing your authorization handler, add this line to be sure it has a
# valid public api:
#
#   it_behaves_like "an authorization handler"
#
# See Decidim::AuthorizationHandler for more documentation.
class DummySignatureHandler < Decidim::Initiatives::SignatureHandler
  # i18n-tasks-use t("decidim.initiatives.initiative_signatures.dummy_signature.form.fields.gender.options.man")
  # i18n-tasks-use t("decidim.initiatives.initiative_signatures.dummy_signature.form.fields.gender.options.non_binary")
  # i18n-tasks-use t("decidim.initiatives.initiative_signatures.dummy_signature.form.fields.gender.options.woman")
  AVAILABLE_GENDERS = %w(man woman non_binary).freeze

  # Define the attributes you need for this authorization handler. Attributes
  # are defined using Decidim::AttributeObject.
  #
  attribute :name_and_surname, String
  attribute :document_type, String
  attribute :document_number, String
  attribute :gender, String
  attribute :postal_code, String
  attribute :date_of_birth, Date
  attribute :scope_id, Integer

  alias signature_scope_id scope_id

  # You can (and should) also define validations on each attribute:
  #
  validates :document_number, presence: true

  validates :document_type,
            inclusion: { in: :document_types },
            presence: true

  validates :gender,
            inclusion: { in: :available_genders },
            allow_blank: true

  def document_types_for_select
    document_types.map do |type|
      [
        I18n.t(type.downcase, scope: "decidim.verifications.id_documents"),
        type
      ]
    end
  end

  def genders_for_select
    available_genders.map do |gender|
      [
        I18n.t(gender, scope: "decidim.initiatives.initiative_signatures.dummy_signature.form.fields.gender.options", default: gender.humanize),
        gender
      ]
    end
  end

  # The only method that needs to be implemented for an authorization handler.
  # Here you can add your business logic to check if the authorization should
  # be created or not, you should return a Boolean value.
  #
  # Note that if you set some validations and overwrite this method, then the
  # validations will not run, so it is easier to remove this method and rewrite
  # your logic using ActiveModel validations.
  #
  # def valid?
  #   raise NotImplementedError
  # end

  # If set, enforces the handler to validate the uniqueness of the field
  #
  def unique_id
    document_number
  end

  # The user scope
  #
  def scope
    user.organization.scopes.find_by(id: scope_id) if scope_id
  end

  # If you need to store any of the defined attributes in the authorization you
  # can do it here.
  #
  # You must return a Hash that will be serialized to the authorization when
  # it is created, and available though authorization.metadata
  #
  def metadata
    super.merge(name_and_surname:, document_type:, document_number:, gender:, date_of_birth:, postal_code:)
  end

  def authorization_handler_params
    super.merge(scope_id:)
  end

  class DummySignatureActionAuthorizer < Decidim::Initiatives::DefaultSignatureAuthorizer; end

  private

  def document_types
    Decidim::Verifications.document_types
  end

  def available_genders
    AVAILABLE_GENDERS
  end
end
