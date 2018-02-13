# frozen_string_literal: true

require "spec_helper"

describe Decidim::GravityForms::Admin::CreateGravityForm do
  subject { described_class.new(form) }

  let(:organization) do
    create(
      :organization,
      available_locales: [:en, :ca, :es],
      default_locale: :en
    )
  end

  let(:participatory_process) do
    create :participatory_process, organization: organization
  end

  let(:current_feature) do
    create(
      :feature,
      participatory_space: participatory_process,
      manifest_name: "gravity_forms"
    )
  end

  let(:form) do
    double(
      invalid?: invalid,
      title: { en: "title" },
      description: { en: "description" },
      slug: "my-slug",
      form_number: "7262",
      require_login: false,
      current_feature: current_feature
    )
  end

  let(:invalid) { false }

  context "when the form is not valid" do
    let(:invalid) { true }

    it "is not valid" do
      expect { subject.call }.to broadcast(:invalid)
    end
  end

  context "when everything is ok" do
    let(:gravity_form) { Decidim::GravityForms::GravityForm.last }

    it "creates the gravity form" do
      expect { subject.call }.to change { Decidim::GravityForms::GravityForm.count }.by(1)
    end

    it "sets the correct attributes" do
      subject.call

      expect(gravity_form.feature).to eq current_feature
      expect(translated(gravity_form.title)).to eq "title"
      expect(translated(gravity_form.description)).to eq "description"
      expect(gravity_form.slug).to eq "my-slug"
      expect(gravity_form.form_number).to eq 7262
      expect(gravity_form.require_login).to eq false
    end
  end
end
