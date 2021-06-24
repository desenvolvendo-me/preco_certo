# frozen_string_literal: true

module Api
  module V1
    class ExpensesController < ApplicationController
      before_action :set_expense, only: %i[show update destroy]

      # GET /api/v1/expenses.json
      def index
        @expenses = Expense.all

        render json: @expenses
      end

      # GET /api/v1/expenses/1.json
      def show

        render json: @expense
      end

      # POST /api/v1/expenses.json
      def create
        @expense = Expense.new(expense_params)

        if @expense.save
          render json: @expense, status: :created
        else
          render json: @expense.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/expenses/1.json
      def update
        if @expense.update(expense_params)
          render json: @expense, status: :ok
        else
          render json: @expense.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/expenses/1.json
      def destroy
        @expense.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_expense
        @expense = Expense.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def expense_params
        params.require(:expense).permit(:description, :value, :company_id)
      end
    end
  end
end
