# frozen_string_literal: true

module Api
  module V1
    class ManpowersController < ApplicationController
      before_action :set_manpower, only: %i[show update destroy]

      # GET /api/v1/manpowers.json
      def index
        @manpowers = Manpower.all

        render json: @manpowers
      end

      # GET /api/v1/manpowers/1.json
      def show
        render json: @manpower
      end

      # POST /api/v1/manpowers.json
      def create
        @manpower = Manpower.new(manpower_params)

        if @manpower.save
          render json: @manpower, status: :created
        else
          render json: @manpower.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/manpowers/1.json
      def update
        if @manpower.update(manpower_params)
          render json: @manpower, status: :ok
        else
          render json: @manpower.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/manpowers/1.json
      def destroy
        @manpower.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_manpower
        @manpower = Manpower.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def manpower_params
        params.require(:manpower).permit(
          :description,
          :time_hex
        )
      end
    end
  end
end
