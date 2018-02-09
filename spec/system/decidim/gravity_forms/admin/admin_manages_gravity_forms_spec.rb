# frozen_string_literal: true

require "spec_helper"

describe "Admin manages gravity forms", type: :system do
  let(:manifest_name) { "gravity_forms" }

  let!(:gravity_form) { create :gravity_form, feature: current_feature }

  include_context "when managing a feature as an admin"

  it_behaves_like "manage gravity forms"
end
