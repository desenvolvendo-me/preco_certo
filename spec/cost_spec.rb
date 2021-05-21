# frozen_string_literal: true

RSpec.describe "Cost" do
  let(:costs) { Cost.costs }

  it "create cost" do
    cost = Cost.create(10, "agua", "100,00")

    expect(cost.id).to eq(10)
    expect(cost.description).to eq("agua")
    expect(cost.value).to eq("100,00")
  end

  it "get all costs" do
    expect(costs.length).to eq(5)
  end

  it "get first cost" do
    expect(costs.first["id"]).to eq("1")
    expect(costs.first["description"]).to eq("aluguel")
    expect(costs.first["value"]).to eq("1500,00")
  end
end
