# frozen_string_literal: true

module Decidim
  module GravityForms
    module Admin
      # This controller is the abstract class from which all other controllers of
      # this engine inherit.
      #
      # Note that it inherits from `Decidim::Admin::Features::BaseController`, which
      # override its layout and provide all kinds of useful methods.
      class ApplicationController < Decidim::Admin::Features::BaseController
        helper_method :gravity_forms

        def gravity_forms
          @gravity_forms ||= GravityForm.where(feature: current_feature).page(params[:page]).per(15)
        end
      end
    end
  end
end
