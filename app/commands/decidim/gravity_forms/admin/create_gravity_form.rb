# frozen_string_literal: true

module Decidim
  module GravityForms
    module Admin
      # This command is executed when the user creates a Gravity form from the
      # admin panel.
      class CreateGravityForm < Rectify::Command
        def initialize(form)
          @form = form
        end

        # Creates the gravity form if valid.
        #
        # Broadcasts :ok if successful, :invalid otherwise.
        def call
          return broadcast(:invalid) if form.invalid?

          create_gravity_form

          broadcast(:ok)
        end

        private

        attr_reader :form

        def create_gravity_form
          GravityForm.create!(
            title: form.title,
            slug: form.slug,
            form_number: form.form_number,
            feature: form.current_feature
          )
        end
      end
    end
  end
end
