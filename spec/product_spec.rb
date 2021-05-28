# frozen_string_literal: true

RSpec.describe "Product" do
  let(:products) { Product.products }

  it "create product" do
    product = Product.create(6, "Ford EcoSport", "UN")
    expect(product.id_product).to eq(6)
    expect(product.description).to eq("Ford EcoSport")
    expect(product.unity).to eq("UN")
  end

  it "get all products" do
    expect(products.length).to eq(5)
  end

  it "calculate manpower of product 1" do
    total_manpower = Product.calculemanpower("1")
    expect(total_manpower).to eq(8.49)
  end

  it "calculate manpower of product 2" do
    total_manpower = Product.calculemanpower("2")
    expect(total_manpower).to eq(8.51)
  end

  it "calculate division expense of product 1" do
    division_expense = Product.calculate_expense_division("1")
    expect(division_expense).to eq(2.955)
  end

  it "get first product" do
    expect(products.first["id_product"]).to eq("1")
    expect(products.first["description"]).to eq("Chevrolet Onix")
    expect(products.first["unity"]).to eq("UN")
  end
end
