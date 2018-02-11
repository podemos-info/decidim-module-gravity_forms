# frozen_string_literal: true

module Decidim
  module GravityForms
    module Admin
      # This class holds a Form to create/update gravity forms from Decidim's
      # admin panel.
      class GravityFormForm < Decidim::Form
        include TranslatableAttributes

        translatable_attribute :title, String

        validates :title, translatable_presence: true
      end
    end
  end
end
