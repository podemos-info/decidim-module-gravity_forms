# frozen_string_literal: true

require "spec_helper"

describe Decidim::GravityForms::Admin::GravityFormForm do
  subject { described_class.from_params(attributes).with_context(context) }

  let(:organization) { create(:organization) }

  let(:context) do
    {
      current_organization: organization,
      current_feature: current_feature
    }
  end

  let(:participatory_process) do
    create :participatory_process, organization: organization
  end

  let(:current_feature) do
    create :feature, participatory_space: participatory_process
  end

  let(:title) do
    Decidim::Faker::Localized.sentence(3)
  end

  let(:attributes) do
    {
      title: title
    }
  end

  it { is_expected.to be_valid }

  describe "when title is missing" do
    let(:title) { { ca: nil, es: nil } }

    it { is_expected.not_to be_valid }
  end
end
