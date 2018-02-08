# frozen_string_literal: true

require "decidim/core/test/factories"

FactoryBot.define do
  factory :gravity_forms_feature, parent: :feature do
    name { Decidim::Features::Namer.new(participatory_space.organization.available_locales, :gravity_forms).i18n_name }
    manifest_name :gravity_forms
    participatory_space { create(:participatory_process, :with_steps) }
  end

  # Add engine factories here
end
