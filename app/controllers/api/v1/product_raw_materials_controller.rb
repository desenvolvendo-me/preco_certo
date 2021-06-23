# frozen_string_literal: true

module Api
  module V1
    class ProductRawMaterialsController < ApplicationController
      before_action :set_product_raw_material, only: %i[show update destroy]

      # GET /api/v1/product_raw_materials.json
      def index
        @product_raw_materials = ProductRawMaterial.all
      end

      # GET /api/v1/product_raw_materials/1.json
      def show; end

      # POST /api/v1/product_raw_materials.json
      def create
        @product_raw_material = ProductRawMaterial.new(product_raw_material_params)

        if @product_raw_material.save
          render json: @product_raw_material, status: :created
        else
          render json: @product_raw_material.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/product_raw_materials/1.json
      def update
        if @product_raw_material.update(product_raw_material_params)
          render json: @product_raw_material, status: :ok
        else
          render json: @product_raw_material.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/product_raw_materials/1.json
      def destroy
        @product_raw_material.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_product_raw_material
        @product_raw_material = ProductRawMaterial.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def product_raw_material_params
        params.require(:product_raw_material).permit(
          :product_id,
          :raw_material_id,
          :consumption
        )
      end
    end
  end
end
