# frozen_string_literal: true

require "spec_helper"

describe "Gravity forms", type: :system do
  include_context "with a feature"

  before do
    switch_to_host(organization.host)
  end

  let(:manifest_name) { "gravity_forms" }

  let(:feature) do
    create(
      :gravity_forms_feature,
      participatory_space: participatory_space,
      settings: { "domain" => "bored-sloth.w6.gravitydemo.com" }
    )
  end

  matcher :render_in_iframe do |content|
    match do |page|
      page.within_frame "js-iframe" do
        expect(page).to have_content(content)
      end
    end
  end

  describe "index page" do
    before do
      create(
        :gravity_form,
        feature: feature,
        title: "My first form",
        description: "Fill this in to become super cool",
        slug: "cuki-form",
        form_number: 1
      )

      create(
        :gravity_form,
        feature: feature,
        title: "My second form",
        description: "Fill this in to become even cooler",
        slug: "cuki-form-2",
        form_number: 2
      )

      visit main_feature_path(feature)
    end

    it "lists all forms and titles" do
      expect(page).to have_selector(".card--gravity_form", count: 2)

      expect(page).to have_selector(".card--gravity_form", text: "My first form Fill this in to become super cool")
      expect(page).to have_selector(".card--gravity_form", text: "My second form Fill this in to become even cooler")
    end
  end

  describe "show page" do
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

    before do
      visit decidim_participatory_process_gravity_forms.gravity_form_path(
        id: gravity_form.id,
        participatory_process_slug: participatory_space.slug,
        feature_id: feature.id
      )
    end

    it "shows gravity form title" do
      expect(page).to have_i18n_content(gravity_form.title)
    end

    it "shows grativy form description" do
      expect(page).to have_i18n_content(gravity_form.description)
    end

    it "shows gravity form content" do
      expect(page).to render_in_iframe("Tell us a little about yourself")
    end
  end
end
