# frozen_string_literal: true

require "rails_helper"

RSpec.describe "/api/v1/products", type: :request do
  let(:product) { create(:product) }
  let(:valid_attributes) { build(:product).attributes }

  let(:invalid_attributes) do
    {
      description: "",
      unity: ""
    }
  end

  describe "GET /index" do
    it "renders a successful response" do
      get api_v1_products_url, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get api_v1_product_url(product), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Product" do
        expect do
          post api_v1_products_url,
               params: { product: valid_attributes }, as: :json
        end.to change(Product, :count).by(1)
      end

      it "renders a JSON response with the new api/v1_product" do
        post api_v1_products_url,
             params: { product: valid_attributes }, as: :json
        expect(response).to have_http_status(:created)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Api::V1::Product" do
        expect do
          post api_v1_products_url,
               params: { product: invalid_attributes }, as: :json
        end.to change(Product, :count).by(0)
      end

      it "renders a JSON response with errors for the new api/v1_product" do
        post api_v1_products_url,
             params: { product: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) do
        { description: "Roda" }
      end

      it "updates the requested api/v1_product" do
        patch api_v1_product_url(product),
              params: { product: new_attributes }, as: :json
        product.reload
        expect(product.description).to eq("Roda")
      end

      it "renders a JSON response with the api/v1_product" do
        patch api_v1_product_url(product),
              params: { product: new_attributes }, as: :json
        expect(response).to have_http_status(:ok)
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the api/v1_product" do
        patch api_v1_product_url(product),
              params: { product: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested api/v1_product" do
      expect do
        delete api_v1_product_url(product), as: :json
      end.to change(Product, :count).by(0)
    end
  end
end
