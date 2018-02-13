# frozen_string_literal: true

class CreateDecidimGravityFormsGravityForms < ActiveRecord::Migration[5.1]
  def change
    create_table :decidim_gravity_forms_gravity_forms do |t|
      t.jsonb :title, null: false
      t.jsonb :description
      t.integer :form_number, null: false
      t.string :slug, null: false
      t.references :decidim_feature

      t.timestamps
    end
  end
end
