# frozen_string_literal: true

module Decidim
  module GravityForms
    class GravityFormsController < Decidim::GravityForms::ApplicationController
      helper_method :gravity_form, :gravity_forms, :accessible_form?

      before_action :authenticate_user!, only: :show, if: -> { gravity_form.require_login }

      def index
        if gravity_forms.one?
          redirect_to gravity_forms.first if accessible_form?(gravity_forms.first)
        end
      end

      private

      def gravity_forms
        @gravity_forms ||= GravityForm.where(feature: current_feature)
      end

      def gravity_form
        @gravity_form ||= gravity_forms.find(params[:id])
      end

      def accessible_form?(gravity_form)
        !gravity_form.require_login ||
          gravity_form.require_login && user_signed_in?
      end
    end
  end
end
