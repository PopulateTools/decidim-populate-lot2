# frozen_string_literal: true

# This migration comes from decidim_participatory_processes (originally 20170808080905)
class AddAnnouncementToParticipatoryProcesses < ActiveRecord::Migration[5.1]
  def change
    add_column :decidim_participatory_processes, :announcement, :jsonb
  end
end
