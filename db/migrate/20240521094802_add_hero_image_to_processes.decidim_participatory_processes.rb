# frozen_string_literal: true

# This migration comes from decidim_participatory_processes (originally 20161011125616)
class AddHeroImageToProcesses < ActiveRecord::Migration[5.0]
  def change
    add_column :decidim_participatory_processes, :hero_image, :string
  end
end
