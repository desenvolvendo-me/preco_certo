# frozen_string_literal: true

require "rails_helper"

RSpec.describe "/api/v1/raw_materials", type: :request do
  let(:valid_attributes) { build(:raw_material).attributes }

  let(:invalid_attributes) do
    {
      name: ""
    }
  end

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # Api::V1::RawMaterialsController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) do
    {}
  end

  describe "GET /index" do
    it "renders a successful response" do
      RawMaterial.create! valid_attributes
      get api_v1_raw_materials_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      raw_material = RawMaterial.create! valid_attributes
      get api_v1_raw_material_url(raw_material), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Api::V1::RawMaterial" do
        expect do
          post api_v1_raw_materials_url,
               params: { raw_material: valid_attributes }, headers: valid_headers, as: :json
        end.to change(RawMaterial, :count).by(1)
      end

      it "renders a JSON response with the new api/v1_raw_material" do
        post api_v1_raw_materials_url,
             params: { raw_material: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Api::V1::RawMaterial" do
        expect do
          post api_v1_raw_materials_url,
               params: { raw_material: invalid_attributes }, as: :json
        end.to change(RawMaterial, :count).by(0)
      end

      it "renders a JSON response with errors for the new api/v1_raw_material" do
        post api_v1_raw_materials_url,
             params: { raw_material: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to include("application/json")
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) do
        { name: "Novo Nome" }
      end

      it "updates the requested api/v1_raw_material" do
        raw_material = RawMaterial.create! valid_attributes
        patch api_v1_raw_material_url(raw_material),
              params: { raw_material: new_attributes }, headers: valid_headers, as: :json
        raw_material.reload
        expect(raw_material.name).to eq("Novo Nome")
      end

      it "renders a JSON response with the api/v1_raw_material" do
        raw_material = RawMaterial.create! valid_attributes
        patch api_v1_raw_material_url(raw_material),
              params: { raw_material: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the api/v1_raw_material" do
        raw_material = RawMaterial.create! valid_attributes
        patch api_v1_raw_material_url(raw_material),
              params: { raw_material: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to include("application/json")
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested api/v1_raw_material" do
      raw_material = RawMaterial.create! valid_attributes
      expect do
        delete api_v1_raw_material_url(raw_material), headers: valid_headers, as: :json
      end.to change(RawMaterial, :count).by(-1)
    end
  end
end
