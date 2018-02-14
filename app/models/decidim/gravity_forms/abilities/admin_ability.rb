# frozen_string_literal: true

module Decidim
  module GravityForms
    module Abilities
      # Defines the abilities related to gravity_forms for a logged in admin user.
      # Intended to be used with `cancancan`.
      class AdminAbility
        include CanCan::Ability

        attr_reader :user, :context

        def initialize(user, context)
          return unless user && user.role?(:admin)

          @user = user
          @context = context

          # can :manage, SomeResource
        end

        private

        def current_settings
          context.fetch(:current_settings, nil)
        end

        def feature_settings
          context.fetch(:feature_settings, nil)
        end
      end
    end
  end
end
