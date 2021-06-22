# frozen_string_literal: true

require "rails_helper"

RSpec.describe "/api/v1/product_raw_materials", type: :request do
  let(:product_raw_material) { create(:product_raw_material) }

  let(:valid_attributes) { build(:product_raw_material).attributes }

  let(:invalid_attributes) do
    {
      product_id: nil,
      raw_material: nil
    }
  end

  describe "GET /index" do
    it "renders a successful response" do
      get api_v1_product_raw_materials_url, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get api_v1_product_raw_material_url(product_raw_material), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new ProductRawMaterial" do
        expect do
          post api_v1_product_raw_materials_url,
               params: { product_raw_material: valid_attributes }, as: :json
        end.to change(ProductRawMaterial, :count).by(1)
      end

      it "renders a JSON response with the new product_raw_material" do
        post api_v1_product_raw_materials_url,
             params: { product_raw_material: valid_attributes }, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new ProductRawMaterial" do
        expect do
          post api_v1_product_raw_materials_url,
               params: { product_raw_material: invalid_attributes }, as: :json
        end.to change(ProductRawMaterial, :count).by(0)
      end

      it "renders a JSON response with errors for the new product_raw_material" do
        post api_v1_product_raw_materials_url,
             params: { product_raw_material: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to include("application/json")
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) do
        {
          consumption: 2.9
        }
      end

      it "updates the requested api/v1_product_raw_material" do
        patch api_v1_product_raw_material_url(product_raw_material),
              params: { product_raw_material: new_attributes }, as: :json
        product_raw_material.reload
        expect(product_raw_material.consumption).to eq(2.9)
      end

      it "renders a JSON response with the api/v1_product_raw_material" do
        patch api_v1_product_raw_material_url(product_raw_material),
              params: { product_raw_material: new_attributes }, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the api/v1_product_raw_material" do
        patch api_v1_product_raw_material_url(product_raw_material),
              params: { product_raw_material: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to include("application/json")
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested api/v1_product_raw_material" do
      expect do
        delete api_v1_product_raw_material_url(product_raw_material), as: :json
      end.to change(ProductRawMaterial, :count).by(0)
    end
  end
end
