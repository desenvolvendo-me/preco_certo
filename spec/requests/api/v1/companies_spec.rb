require 'rails_helper'

RSpec.describe "/api/v1/companies", type: :request do
  let(:valid_attributes) { build(:company).attributes }

  let(:invalid_attributes) {
    {
      name: "",
      cpnj: "",
      tax_regime: "",
    }
  }

  describe "GET /index" do
    it "renders a successful response" do
      Company.create! valid_attributes
      get api_v1_companies_url, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      company = Company.create! valid_attributes
      get api_v1_company_url(company), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Company" do
        expect {
          post api_v1_companies_url,
               params: { company: valid_attributes }, as: :json
        }.to change(Company, :count).by(1)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Api::V1::Company" do
        expect {
          post api_v1_companies_url,
               params: { company: invalid_attributes }, as: :json
        }.to change(Company, :count).by(0)
      end

      it "renders a JSON response with errors for the new api/v1_company" do
        post api_v1_companies_url,
             params: { company: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { name: "Novo Nome" }
      }

      it "updates the requested api/v1_company" do
        company = Company.create! valid_attributes
        patch api_v1_company_url(company),
              params: { company: new_attributes }, as: :json
        company.reload
        expect(company.name).to eq("Novo Nome")
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the api/v1_company" do
        company = Company.create! valid_attributes
        patch api_v1_company_url(company),
              params: { company: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested api/v1_company" do
      company = Company.create! valid_attributes
      expect {
        delete api_v1_company_url(company), as: :json
      }.to change(Company, :count).by(-1)
    end
  end
end
