# frozen_string_literal: true

# This migration comes from decidim (originally 20180215104821)
class CreateDecidimAreaTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :decidim_area_types do |t|
      t.references :decidim_organization, foreign_key: true, index: true
      t.jsonb :name, null: false
      t.jsonb :plural, null: false
    end
  end
end
