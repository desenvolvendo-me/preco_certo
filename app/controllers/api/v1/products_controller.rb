# frozen_string_literal: true

module Api::V1
  class ProductsController < ApplicationController
    before_action :set_product, only: %i[show update destroy]

    # GET /api/v1/products
    # GET /api/v1/products.json
    def index
      @products = Product.all
    end

    # GET /api/v1/products/1
    # GET /api/v1/products/1.json
    def show; end

    # POST /api/v1/products
    # POST /api/v1/products.json
    def create
      @product = Product.new(product_params)

      if @product.save
        render json: @product, status: :created
      else
        render json: @product.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /api/v1/products/1
    # PATCH/PUT /api/v1/products/1.json
    def update
      if @product.update(product_params)
        render json: @product, status: :ok
      else
        render json: @product.errors, status: :unprocessable_entity
      end
    end

    # DELETE /api/v1/products/1
    # DELETE /api/v1/products/1.json
    def destroy
      @product.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:description, :unity)
    end
  end
end
