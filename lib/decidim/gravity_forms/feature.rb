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

  feature.register_resource do |resource|
    resource.model_class_name = "Decidim::GravityForms::GravityForm"
  end

  # feature.register_stat :some_stat do |context, start_at, end_at|
  #   # Register some stat number to the application
  # end

  feature.seeds do |participatory_space|
    feature = Decidim::Feature.create!(
      name: Decidim::Features::Namer.new(participatory_space.organization.available_locales, :gravity_forms).i18n_name,
      manifest_name: :gravity_forms,
      published_at: Time.current,
      participatory_space: participatory_space
    )

    Decidim::GravityForms::GravityForm.create!(
      feature: feature,
      title: Decidim::Faker::Localized.sentence(2),
      slug: Faker::Internet.unique.slug(nil, "-"),
      form_number: 1
    )
  end
end
