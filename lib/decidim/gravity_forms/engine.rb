# frozen_string_literal: true

require "rails"
require "decidim/core"

module Decidim
  module GravityForms
    # This is the engine that runs on the public interface of gravity_forms.
    class Engine < ::Rails::Engine
      isolate_namespace Decidim::GravityForms

      routes do
        # Add engine routes here
        # resources :gravity_forms
        # root to: "gravity_forms#index"
      end

      initializer "decidim_gravity_forms.assets" do |app|
        app.config.assets.precompile += %w(decidim_gravity_forms_manifest.js decidim_gravity_forms_manifest.css)
      end

      initializer "decidim_gravity_forms.inject_abilities_to_user" do |_app|
        Decidim.configure do |config|
          config.abilities += ["Decidim::GravityForms::Abilities::CurrentUser"]
        end
      end
    end
  end
end
