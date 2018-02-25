# frozen_string_literal: true

class AddHiddenAtToDecidimGravityForms < ActiveRecord::Migration[5.1]
  def change
    add_column :decidim_gravity_forms_gravity_forms, :hidden_at, :datetime
  end
end
