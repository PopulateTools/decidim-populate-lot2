# frozen_string_literal: true

# This migration comes from decidim_sortitions (originally 20180103082645)
class AddTitleToSortition < ActiveRecord::Migration[5.1]
  def change
    add_column :decidim_module_sortitions_sortitions, :title, :jsonb
  end
end
