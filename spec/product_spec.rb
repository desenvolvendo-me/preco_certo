# frozen_string_literal: true

RSpec.describe "Product" do
  let(:products) { Product.products }

  it "create product" do
    product = Product.create(6, "Ford EcoSport", "UN")
    expect(product.id).to eq(6)
    expect(product.description).to eq("Ford EcoSport")
    expect(product.unity).to eq("UN")
  end

  it "get all products" do
    expect(products.length).to eq(5)
  end

  it "calculate manpower of product 1" do
    total_manpower = Product.calculate_manpower("1")
    expect(total_manpower).to eq(8.49)
  end

  it "calculate manpower of product 2" do
    total_manpower = Product.calculate_manpower("2")
    expect(total_manpower).to eq(8.51)
  end

  it "calculate daily manual manpower of product 1" do
    product = products.find { |prod| prod.id == "1" }

    expect(product.daily_manual_manpower).to be_within(0.01).of(3.65)
  end

  it "calculate daily manual manpower of product 2" do
    product = products.find { |prod| prod.id == "2" }

    expect(product.daily_manual_manpower).to be_within(0.01).of(4.18)
  end

  it "calculate division expense of product 1" do
    division_expense = Product.calculate_expense_division("1")
    expect(division_expense).to eq(2.955)
  end

  it "get first product" do
    product = products.first

    expect(product.id).to eq("1")
    expect(product.description).to eq("Chevrolet Onix")
    expect(product.unity).to eq("UN")
  end

  it "calculate sale price of the one product" do
    product = products.first

    expect(product.sale_price).to eq(23_352.41)
  end
end
