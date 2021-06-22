# frozen_string_literal: true

require "rails_helper"

RSpec.describe RawMaterial, type: :model do
  describe "associations" do
    it { should has_many(:product_raw_materials) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of :name }
  end
end
