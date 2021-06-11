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

  context ".calculate_manpower" do
    it { expect(Product.calculate_manpower("1")).to eq(8.49) }
    it { expect(Product.calculate_manpower("2")).to eq(8.51) }
  end

  context "daily manpower calcs" do
    def product(id)
      products.find { |prod| prod.id == id }
    end

    describe ".daily_manual_manpower" do
      it { expect(product("1").daily_manual_manpower).to be_within(0.01).of(3.65) }
      it { expect(product("2").daily_manual_manpower).to be_within(0.01).of(4.18) }
    end

    describe ".daily_machine_manpower" do
      it { expect(product("1").daily_machine_manpower).to be_within(0.01).of(1.98) }
      it { expect(product("2").daily_machine_manpower).to be_within(0.01).of(2.58) }
    end
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
