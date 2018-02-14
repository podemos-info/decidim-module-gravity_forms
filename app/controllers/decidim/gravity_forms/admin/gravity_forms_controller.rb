# frozen_string_literal: true

module Decidim
  module GravityForms
    module Admin
      # Administration of Gravity Forms
      class GravityFormsController < Admin::ApplicationController
        helper_method :gravity_forms

        def new
          @form = form(GravityFormForm).instance
        end

        def create
          @form = form(GravityFormForm).from_params(params, current_feature: current_feature)

          CreateGravityForm.call(@form) do
            on(:ok) do
              flash[:notice] = I18n.t("gravity_forms.create.success", scope: "decidim.gravity_forms.admin")
              redirect_to gravity_forms_path
            end

            on(:invalid) do
              flash.now[:alert] = I18n.t("gravity_forms.create.invalid", scope: "decidim.gravity_forms.admin")
              render action: "new"
            end
          end
        end

        private

        def gravity_forms
          @gravity_forms ||= GravityForm.where(feature: current_feature).page(params[:page]).per(15)
        end
      end
    end
  end
end
