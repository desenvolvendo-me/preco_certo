# frozen_string_literal: true

module Api
  module V1
    class RawMaterialsController < ApplicationController
      before_action :set_api_v1_raw_material, only: %i[show update destroy]

      # GET /api/v1/raw_materials.json
      def index
        @raw_materials = RawMaterial.all

        render json: @raw_materials
      end

      # GET /api/v1/raw_materials/1.json
      def show
        render json: @raw_material
      end

      # POST /api/v1/raw_materials.json
      def create
        @raw_material = RawMaterial.new(raw_material_params)

        if @raw_material.save
          render json: @raw_material, status: :created
        else
          render json: @raw_material.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/raw_materials/1.json
      def update
        if @raw_material.update(raw_material_params)
          render json: @raw_material, status: :ok
        else
          render json: @raw_material.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/raw_materials/1.json
      def destroy
        @raw_material.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_api_v1_raw_material
        @raw_material = RawMaterial.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def raw_material_params
        params.require(:raw_material).permit(
          :id,
          :name,
          :price,
          :icms,
          :ipi,
          :pis,
          :cofins,
          :net_price
        )
      end
    end
  end
end
