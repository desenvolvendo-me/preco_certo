# frozen_string_literal: true

require "rails_helper"

RSpec.describe ProductRawMaterial, type: :model do
  describe "associations" do
    it { should belong_to(:product) }
    it { should belong_to(:raw_material) }
  end

  describe "calculate" do
    it "raw material cost" do
      raw_material = create(:raw_material, net_price: 2)
      product_raw_material = create(:product_raw_material, consumption: 5, raw_material: raw_material)

      expect(product_raw_material.raw_material_cost).to eq(10.0)
    end
  end
end
