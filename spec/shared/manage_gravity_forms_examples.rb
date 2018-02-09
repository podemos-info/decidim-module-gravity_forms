# frozen_string_literal: true

shared_examples "manage gravity forms" do
  describe "previewing gravity forms" do
    it "allows the user to preview the gravity form" do
      within find("tr", text: gravity_form.title) do
        klass = "action-icon--preview"
        href = resource_locator(gravity_form).path
        target = "blank"

        expect(page).to have_selector(
          :xpath,
          "//a[contains(@class,'#{klass}')][@href='#{href}'][@target='#{target}']"
        )
      end
    end
  end
end
