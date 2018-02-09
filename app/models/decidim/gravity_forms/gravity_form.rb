# frozen_string_literal: true

module Decidim
  module GravityForms
    class GravityForm < ApplicationRecord
      include Decidim::Resourceable
      include Decidim::HasFeature
    end
  end
end
