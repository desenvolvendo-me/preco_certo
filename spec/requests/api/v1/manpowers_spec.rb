require 'rails_helper'

RSpec.describe "/api/v1/manpowers", type: :request do

  let(:valid_attributes) { build(:manpower).attributes }

  let(:invalid_attributes) {
    {
      description: "",
      time_hex: ""
    }
  }

  describe "GET /index" do
    it "renders a successful response" do
      Manpower.create! valid_attributes
      get api_v1_manpowers_url, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      manpower = Manpower.create! valid_attributes
      get api_v1_manpower_url(manpower), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Manpower" do
        expect {
          post api_v1_manpowers_url,
               params: { manpower: valid_attributes }, as: :json
        }.to change(Manpower, :count).by(1)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Manpower" do
        expect {
          post api_v1_manpowers_url,
               params: { manpower: invalid_attributes }, as: :json
        }.to change(Manpower, :count).by(0)
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
      let(:new_attributes) {
        { description: "Montagem do motor" }
      }

      it "updates the requested api/v1_manpower" do
        manpower = Manpower.create! valid_attributes
        patch api_v1_manpower_url(manpower),
              params: { manpower: new_attributes }, as: :json
        manpower.reload
        expect(manpower.description).to eq("Montagem do motor")
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the api/v1_manpower" do
        manpower = Manpower.create! valid_attributes
        patch api_v1_manpower_url(manpower),
              params: { manpower: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested api/v1_manpower" do
      manpower = Manpower.create! valid_attributes
      expect {
        delete api_v1_manpower_url(manpower), as: :json
      }.to change(Manpower, :count).by(-1)
    end
  end
end
