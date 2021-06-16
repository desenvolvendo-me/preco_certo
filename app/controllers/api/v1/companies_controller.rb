class Api::V1::CompaniesController < ApplicationController
  before_action :set_api_v1_company, only: %i[ show update destroy ]

  # GET /api/v1/companies.json
  def index
    @companies = Company.all
  end

  # GET /api/v1/companies/1.json
  def show
  end

  # POST /api/v1/companies.json
  def create
    @company = Company.new(company_params)

    if @company.save
      render json: @company, status: :created
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/companies/1.json
  def update
    if @company.update(company_params)
      render json: @company, status: :ok
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/companies/1.json
  def destroy
    @company.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_api_v1_company
    @company = Company.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def company_params
    params.permit(
      :name,
      :cnpj,
      :phone,
      :tax_regime,
      :icms,
      :ipi,
      :pis,
      :cofins,
      :payroll_percentage,
    )
  end
end
