# frozen_string_literal: true

# This migration comes from decidim_surveys (originally 20170524122229)
class AddQuestionTypeToSurveysQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :decidim_surveys_survey_questions, :question_type, :string
  end
end
