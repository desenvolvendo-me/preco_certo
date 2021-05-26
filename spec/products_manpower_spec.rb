# frozen_string_literal: true

RSpec.describe "Product_ManPower" do
  let(:productsmanpowers) { ProductManPower.productsmanpower}

  it "create ProductManPower" do
    product_manpower = ProductManPower.create(6,"Montagem dos Bancos", "Luciano Paulista", "1200.00", 8.50,15.50)
    expect(product_manpower.id_product).to eq(6)
    expect(product_manpower.operation).to eq("Montagem dos Bancos")
    expect(product_manpower.employee).to eq("Luciano Paulista")
    expect(product_manpower.salary).to eq("1200.00")
    expect(product_manpower.time).to eq(8.50)
    expect(product_manpower.cost_mo).to eq(15.50)
  end

  it "get all products_manpower" do
    expect(productsmanpowers.length).to eq(5)
  end

  it "get first product_manpower" do
    expect(productsmanpowers.first["id_product"]).to eq("1")
    expect(productsmanpowers.first["operation"]).to eq("Colocar Carroceria")
    expect(productsmanpowers.first["employee"]).to eq("Luciano Paulista")
    expect(productsmanpowers.first["salary"]).to eq("1.700,00")
    expect(productsmanpowers.first["time"]).to eq("20,50")
    expect(productsmanpowers.first["cost_mo"]).to eq("2,64")
  end
end
