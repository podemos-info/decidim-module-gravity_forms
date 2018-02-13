# frozen_string_literal: true

require "spec_helper"

describe "Load gravity forms", type: :system do
  include_context "with a feature"

  let(:manifest_name) { "gravity_forms" }

  let(:feature) do
    create(
      :gravity_forms_feature,
      participatory_space: participatory_space,
      settings: { "domain" => "bored-sloth.w6.gravitydemo.com" }
    )
  end

  let!(:gravity_form) do
    create(
      :gravity_form,
      feature: feature,
      title: "My cuki form",
      description: "Fill this in to become super cool",
      slug: "cuki-form",
      form_number: 1
    )
  end

  let(:path) do
    decidim_participatory_process_gravity_forms.gravity_form_path(
      id: gravity_form.id,
      participatory_process_slug: participatory_space.slug,
      feature_id: feature.id
    )
  end

  before do
    switch_to_host(organization.host)

    visit path
  end

  it "shows gravity form title" do
    expect(page).to have_i18n_content(gravity_form.title)
  end

  it "shows grativy form description" do
    expect(page).to have_i18n_content(gravity_form.description)
  end

  it "shows gravity form content" do
    within_frame "js-iframe" do
      expect(page).to have_content "Tell us a little about yourself"
    end
  end
end
