# frozen_string_literal: true

require_dependency "decidim/features/namer"

Decidim.register_feature(:gravity_forms) do |feature|
  feature.engine = Decidim::GravityForms::Engine
  feature.admin_engine = Decidim::GravityForms::AdminEngine
  feature.icon = "decidim/gravity_forms/icon.svg"

  # feature.on(:before_destroy) do |instance|
  #   # Code executed before removing the feature
  # end

  # These actions permissions can be configured in the admin panel
  # feature.actions = %w()

  # feature.settings(:global) do |settings|
  #   # Add your global settings
  #   # Available types: :integer, :boolean
  #   # settings.attribute :vote_limit, type: :integer, default: 0
  # end

  # feature.settings(:step) do |settings|
  #   # Add your settings per step
  # end

  # feature.register_resource do |resource|
  #   # Register a optional resource that can be references from other resources.
  #   resource.model_class_name = "Decidim::GravityForms::SomeResource"
  #   resource.template = "decidim/gravity_forms/some_resources/linked_some_resources"
  # end

  # feature.register_stat :some_stat do |context, start_at, end_at|
  #   # Register some stat number to the application
  # end

  # feature.seeds do |participatory_space|
  #   # Add some seeds for this feature
  # end
end
