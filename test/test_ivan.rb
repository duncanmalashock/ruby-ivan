require_relative "minitest_helper"

describe "Ivan module" do
  describe "#models" do
    it "returns the models constant" do
      # FIXME: Can't test this predictably
    end
  end
  describe "#set_model_path" do
    it "returns the path" do
      assert_equal "x", Ivan.set_model_path("x")
    end
  end
  describe "#default_focal_length" do
    it "returns the default_focal_length" do
      assert_equal -125.0, Ivan.default_focal_length
    end
  end
end