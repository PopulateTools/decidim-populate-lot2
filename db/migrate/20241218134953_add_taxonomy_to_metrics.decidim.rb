# frozen_string_literal: true

# This migration comes from decidim (originally 20241127093708)
class AddTaxonomyToMetrics < ActiveRecord::Migration[7.0]
  def change
    add_reference :decidim_metrics, :decidim_taxonomy, index: true
  end
end