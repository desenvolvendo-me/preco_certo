# frozen_string_literal: true

require "preco_certo/manpower"

RSpec.describe "Man_Power" do
  let(:manpowers) { ManPower.manpowers }

  it "create manpower" do
    manpower = ManPower.create(6, "Montagem dos Bancos", "1,80")
    expect(manpower.id_manpower).to eq(6)
    expect(manpower.description).to eq("Montagem dos Bancos")
    expect(manpower.time).to eq("1,80")
  end

  it "get all products" do
    expect(manpowers.length).to eq(5)
  end

  it "get first product" do
    expect(manpowers.first["id_manpower"]).to eq("1")
    expect(manpowers.first["description"]).to eq("Montagem do motor")
    expect(manpowers.first["time"]).to eq("10,50")
  end
end
