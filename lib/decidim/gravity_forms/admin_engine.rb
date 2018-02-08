# frozen_string_literal: true

module Decidim
  module GravityForms
    # This is the engine that runs on the public interface of `GravityForms`.
    class AdminEngine < ::Rails::Engine
      isolate_namespace Decidim::GravityForms::Admin

      paths["db/migrate"] = nil

      routes do
        # Add admin engine routes here
        # resources :gravity_forms do
        #   collection do
        #     resources :exports, only: [:create]
        #   end
        # end
        # root to: "gravity_forms#index"
      end

      initializer "decidim_gravity_forms.inject_abilities_to_user" do |_app|
        Decidim.configure do |config|
          config.admin_abilities += ["Decidim::GravityForms::Abilities::AdminUser"]
          config.admin_abilities += ["Decidim::GravityForms::Abilities::ProcessAdminUser"]
        end
      end

      def load_seed
        nil
      end
    end
  end
end
