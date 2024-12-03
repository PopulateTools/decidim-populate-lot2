# frozen_string_literal: true

# This migration comes from decidim (originally 20241111104357)
class AddNamesAndSpaceBooleanToTaxonomyFilters < ActiveRecord::Migration[7.0]
  def change
    add_column :decidim_taxonomy_filters, :name, :jsonb, default: {}
    add_column :decidim_taxonomy_filters, :internal_name, :jsonb, default: {}
    add_column :decidim_taxonomy_filters, :space_filter, :boolean, null: false, default: false
  end
end