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

  it "get first product" do
    expect(products.first["id_product"]).to eq("1")
    expect(products.first["description"]).to eq("Chevrolet Onix")
    expect(products.first["unity"]).to eq("UN")
  end
end
