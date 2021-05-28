# frozen_string_literal: true

RSpec.describe "Markup" do
  let(:markups) { Markup.markup }

  it "create Markup" do
    markup = Markup.create(6, "Venda Estado AC", 15.00, 8.00, 3.00, 1.50, 12.00, 5.00, 0.65, 3.00)
    expect(markup.id_markup).to eq(6)
    expect(markup.description).to eq("Venda Estado AC")
    expect(markup.profit).to eq(15.00)
    expect(markup.commission).to eq(8.00)
    expect(markup.shipping).to eq(3.00)
    expect(markup.marketing).to eq(1.50)
    expect(markup.icms).to eq(12.00)
    expect(markup.ipi).to eq(5.00)
    expect(markup.pis).to eq(0.65)
    expect(markup.cofins).to eq(3.00)
  end

  it "calculate index of markup id=1" do
    index = Markup.calculate_index("1")
    expect(index).to eq(1.66666667)
  end

  it "calculate index of markup id=2" do
    index = Markup.calculate_index("2")
    expect(index).to eq(1.40845070)
  end

  it "get all markups" do
    expect(markups.length).to eq(5)
  end

  it "get first markup" do
    expect(markups.first["id_markup"]).to eq("1")
    expect(markups.first["description"]).to eq("Venda Estado SP")
    expect(markups.first["profit"]).to eq("10.00")
    expect(markups.first["commission"]).to eq("8.00")
    expect(markups.first["shipping"]).to eq("3.00")
    expect(markups.first["marketing"]).to eq("1.00")
    expect(markups.first["icms"]).to eq("18.00")
    expect(markups.first["ipi"]).to eq("0.00")
    expect(markups.first["pis"]).to eq("0.00")
    expect(markups.first["cofins"]).to eq("0.00")
  end
end
