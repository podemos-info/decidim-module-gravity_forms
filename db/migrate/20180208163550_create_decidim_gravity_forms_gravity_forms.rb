# frozen_string_literal: true

class CreateDecidimGravityFormsGravityForms < ActiveRecord::Migration[5.1]
  def change
    create_table :decidim_gravity_forms_gravity_forms do |t|
      t.jsonb :title
      t.string :slug
      t.integer :gravity_id
      t.string :gravity_link
      t.references :decidim_feature

      t.timestamps
    end
  end
end
