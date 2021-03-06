# frozen_string_literal: true

require "i18n/tasks"

RSpec.describe "I18n" do
  let(:i18n) { I18n::Tasks::BaseTask.new(locales: [:en, :es]) }
  let(:missing_keys) { i18n.missing_keys }
  let(:unused_keys) { i18n.unused_keys }
  let(:non_normalized_paths) { i18n.non_normalized_paths }

  it "does not have missing keys" do
    expect(missing_keys).to be_empty, "#{missing_keys.inspect} are missing"
  end

  it "does not have unused keys" do
    expect(unused_keys).to be_empty, "#{unused_keys.inspect} are unused"
  end

  it "is normalized" do
    error_message = "The following files need to be normalized:\n" \
                    "#{non_normalized_paths.map { |path| "  #{path}" }.join("\n")}\n" \
                    "Please run `i18n-tasks normalize` to fix them"

    expect(non_normalized_paths).to be_empty, error_message
  end
end
