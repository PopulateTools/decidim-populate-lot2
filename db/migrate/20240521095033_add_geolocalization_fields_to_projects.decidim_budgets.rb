# frozen_string_literal: true

# This migration comes from decidim_budgets (originally 20220428072638)
class AddGeolocalizationFieldsToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :decidim_budgets_projects, :address, :text
    add_column :decidim_budgets_projects, :latitude, :float
    add_column :decidim_budgets_projects, :longitude, :float
  end
end
