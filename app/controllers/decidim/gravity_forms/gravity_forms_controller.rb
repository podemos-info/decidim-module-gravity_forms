# frozen_string_literal: true

module Decidim
  module GravityForms
    class GravityFormsController < Decidim::GravityForms::ApplicationController
      helper_method :gravity_form

      private

      def gravity_form
        @gravity_form ||=
          GravityForm.where(feature: current_feature).find(params[:id])
      end
    end
  end
end
