# frozen_string_literal: true

RSpec.describe "ProductRawMaterial" do
  let(:product_raw_materials) { ProductRawMaterial.product_raw_material }

  it "create ProductRawMaterial" do
    product_raw_material = ProductRawMaterial.create(6, 1, "Volante", 200, 1, 200)
    expect(product_raw_material.product_id).to eq(1)
    expect(product_raw_material.raw_material_description).to eq("Volante")
    expect(product_raw_material.net_price).to eq(200)
    expect(product_raw_material.consumption).to eq(1)
    expect(product_raw_material.raw_material_cost).to eq(200)
    expect(product_raw_material.id).to eq(6)
  end

  it "get all products_manpower" do
    expect(product_raw_materials.length).to eq(5)
  end

  it "get first product_raw_material" do
    expect(product_raw_materials.first["product_id"]).to eq("1")
    expect(product_raw_materials.first["raw_material_description"]).to eq("Carroceria")
    expect(product_raw_materials.first["net_price"]).to eq("5.000,00")
    expect(product_raw_materials.first["consumption"]).to eq("1")
    expect(product_raw_materials.first["raw_material_cost"]).to eq("5.000,00")
    expect(product_raw_materials.first["id"]).to eq("1")
  end
end
