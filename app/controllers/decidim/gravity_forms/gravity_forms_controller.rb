# frozen_string_literal: true

module Decidim
  module GravityForms
    class GravityFormsController < Decidim::GravityForms::ApplicationController
      helper_method :gravity_form, :gravity_forms

      before_action :authenticate_user!, only: :show, if: -> { gravity_form.require_login }

      private

      def gravity_forms
        @gravity_forms ||= GravityForm.where(feature: current_feature)
      end

      def gravity_form
        @gravity_form ||= gravity_forms.find(params[:id])
      end
    end
  end
end
