# frozen_string_literal: true

require "rails_helper"

RSpec.describe "/api/v1/expenses", type: :request do
  let(:expense) { create(:expense) }
  let(:valid_attributes) { build(:expense).attributes }

  let(:invalid_attributes) do
    {
      description: "",
      value: nil
    }
  end

  describe "GET /index" do
    it "renders a successful response" do
      get api_v1_expenses_url, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get api_v1_expense_url(expense), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Expense" do
        expect do
          post api_v1_expenses_url,
               params: { expense: valid_attributes }, as: :json
        end.to change(Expense, :count).by(1)
      end

      it "renders a JSON response with the new expense" do
        post api_v1_expenses_url,
             params: { expense: valid_attributes }, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to include("application/json")
      end
    end

    context "with invalid parameters" do
      it "does not create a new Expense" do
        expect do
          post api_v1_expenses_url,
               params: { expense: invalid_attributes }, as: :json
        end.to change(Expense, :count).by(0)
      end

      it "renders a JSON response with errors for the new expense" do
        post api_v1_expenses_url,
             params: { expense: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to include("application/json")
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) do
        {
          description: "Nova Descrição"
        }
      end

      it "updates the requested expense" do
        patch api_v1_expense_url(expense),
              params: { expense: new_attributes }, as: :json
        expense.reload
        expect(expense.description).to eq("Nova Descrição")
      end

      it "renders a JSON response with the expense" do
        patch api_v1_expense_url(expense),
              params: { expense: new_attributes }, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to include("application/json")
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the api/v1_expense" do
        patch api_v1_expense_url(expense),
              params: { expense: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to include("application/json")
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested api/v1_expense" do
      expect do
        delete api_v1_expense_url(expense), as: :json
      end.to change(Expense, :count).by(0)
    end
  end
end
