# frozen_string_literal: true

require "rails_helper"

RSpec.describe "/api/v1/manpowers", type: :request do
  let(:mam_power) { create(:manpower) }
  let(:valid_attributes) { build(:manpower).attributes }

  let(:invalid_attributes) do
    {
      description: "",
      time_hex: ""
    }
  end

  describe "GET /index" do
    it "renders a successful response" do
      get api_v1_manpowers_url, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get api_v1_manpower_url(mam_power), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Manpower" do
        expect do
          post api_v1_manpowers_url,
               params: { manpower: valid_attributes }, as: :json
        end.to change(Manpower, :count).by(1)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Manpower" do
        expect do
          post api_v1_manpowers_url,
               params: { manpower: invalid_attributes }, as: :json
        end.to change(Manpower, :count).by(0)
      end

      it "renders a JSON response with errors for the new api/v1_manpower" do
        post api_v1_manpowers_url,
             params: { manpower: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) do
        { description: "Montagem do motor" }
      end

      it "updates the requested api/v1_manpower" do
        patch api_v1_manpower_url(mam_power),
              params: { manpower: new_attributes }, as: :json
        mam_power.reload
        expect(mam_power.description).to eq("Montagem do motor")
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the api/v1_manpower" do
        patch api_v1_manpower_url(mam_power),
              params: { manpower: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested api/v1_manpower" do
      expect do
        delete api_v1_manpower_url(mam_power), as: :json
      end.to change(Manpower, :count).by(-1)
    end
  end
end
