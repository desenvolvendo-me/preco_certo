# frozen_string_literal: true

module Api
  module V1
    class ProductionGoalsController < ApplicationController
      before_action :set_production_goal, only: %i[show update destroy]

      # GET /api/v1/production_goals
      # GET /api/v1/production_goals.json
      def index
        @production_goals = ProductionGoal.all
      end

      # GET /api/v1/production_goals/1
      # GET /api/v1/production_goals/1.json
      def show; end

      # POST /api/v1/production_goals
      # POST /api/v1/production_goals.json
      def create
        @production_goal = ProductionGoal.new(production_goal_params)

        if @production_goal.save
          render json: @production_goal, status: :created
        else
          render json: @production_goal.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/production_goals/1
      # PATCH/PUT /api/v1/production_goals/1.json
      def update
        if @production_goal.update(production_goal_params)
          render json: @production_goal, status: :ok
        else
          render json: @production_goal.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/production_goals/1
      # DELETE /api/v1/production_goals/1.json
      def destroy
        @production_goal.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_production_goal
        @production_goal = ProductionGoal.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def production_goal_params
        params.require(:production_goal).permit(
          :product_id,
          :monthly_goal
        )
      end
    end
  end
end
