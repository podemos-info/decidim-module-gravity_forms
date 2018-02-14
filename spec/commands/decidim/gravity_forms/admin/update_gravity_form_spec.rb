# frozen_string_literal: true

require "spec_helper"

describe Decidim::GravityForms::Admin::UpdateGravityForm do
  subject { described_class.new(form, gravity_form) }

  let(:gravity_form) do
    create(
      :gravity_form,
      title: { en: "old-title" },
      description: { en: "old-description" },
      slug: "old-slug",
      form_number: 42,
      require_login: true,
      feature: current_feature
    )
  end

  let(:form) do
    double(
      invalid?: invalid,
      title: { en: "new title" },
      description: { en: "new description" },
      slug: "new-slug",
      form_number: 57,
      require_login: false,
      current_feature: current_feature
    )
  end

  let(:current_feature) do
    create(:feature, manifest_name: "gravity_forms")
  end

  context "when the form is not valid" do
    let(:invalid) { true }

    it "is not valid" do
      expect { subject.call }.to broadcast(:invalid)
    end
  end

  context "when everything is ok" do
    let(:invalid) { false }

    it "updates the gravity form" do
      subject.call

      expect(translated(gravity_form.title)).to eq "new title"
      expect(translated(gravity_form.description)).to eq "new description"
      expect(gravity_form.slug).to eq "new-slug"
      expect(gravity_form.form_number).to eq 57
      expect(gravity_form.require_login).to be false
    end
  end
end