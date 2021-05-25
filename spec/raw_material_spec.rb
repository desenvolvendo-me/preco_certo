# frozen_string_literal: true

RSpec.describe "Raw_material" do
  let!(:raw_material) { RawMaterial.new("preco_certo/storage/raw_materials.csv") }

  it "create a raw_material" do
    id = 2
    name = "arroz"
    price = "3.50"
    icms = "12"
    ipi = "0"
    pis = "3.50"
    cofins = "7"

    raw_material.create([id, name, price, icms, ipi, pis, cofins])

    raw_materials = raw_material.raw_materials
    created_raw_material = raw_materials[raw_materials.length - 1]

    expect(created_raw_material["name"]).to eq(name)
    expect(created_raw_material["price"]).to eq(price)
    expect(created_raw_material["icms"]).to eq(icms)
    expect(created_raw_material["ipi"]).to eq(ipi)
  end

  it "get first raw_material" do
    raw_materials = raw_material.raw_materials

    expect(raw_materials.first["id"]).to eq("1")
    expect(raw_materials.first["name"]).to eq("farinha de trigo")
    expect(raw_materials.first["price"]).to eq("20.00")
    expect(raw_materials.first["icms"]).to eq("12")
  end
end
