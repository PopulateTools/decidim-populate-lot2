# frozen_string_literal: true

# This migration comes from decidim_meetings (originally 20210520084247)
class CreateDecidimMeetingsQuestionnaires < ActiveRecord::Migration[6.0]
  def change
    create_table :decidim_meetings_questionnaires do |t|
      t.references :questionnaire_for, polymorphic: true, index: { name: "index_decidim_meetings_questionnaires_questionnaire_for" }

      t.timestamps
    end
  end
end
