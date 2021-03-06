# frozen_string_literal: true

RSpec.describe "ProductionGoals" do
  let(:productions_goals) { ProductionGoals.all }

  it "create production goals" do
    production_goals = ProductionGoals.create(8, 10, "Audi - A3", "1300")

    expect(production_goals.id).to eq(8)
    expect(production_goals.id_product).to eq(10)
    expect(production_goals.description).to eq("Audi - A3")
    expect(production_goals.monthly_goal).to eq("1300")
  end

  it "get all productions goals" do
    expect(productions_goals.length).to eq(5)
  end

  it "get first production goals" do
    expect(productions_goals.first.id).to eq("1")
    expect(productions_goals.first.id_product).to eq("1")
    expect(productions_goals.first.description).to eq("Ford – Ecosport")
    expect(productions_goals.first.monthly_goal).to eq("1000")
  end

  it "get productions goal by id 3" do
    product_goal = ProductionGoals.get_product_goal("3")
    expect(product_goal.id).to eq("3")
  end
end
