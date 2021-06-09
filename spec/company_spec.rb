# frozen_string_literal: true

RSpec.describe "Company" do
  let!(:company) { Company.new("preco_certo/storage/companies.csv") }

  before do
    company.create(6, "empresa5", "real_profit", "8655559696", "52744494000112", 1.2, 3, 4, 2, 20)
  end

  let(:created_company) { company.companies[company.companies.length - 1] }

  context "validations csv" do
    it "create a company" do
      expect(created_company["name"]).to eq("empresa5")
      expect(created_company["tax_regime"]).to eq("real_profit")
      expect(created_company["phone"]).to eq("8655559696")
      expect(created_company["cnpj"]).to eq("52744494000112")
      expect(created_company["icms"]).to eq("1.2")
      expect(created_company["ipi"]).to eq("3")
      expect(created_company["pis"]).to eq("4")
      expect(created_company["cofins"]).to eq("2")
      expect(created_company["payroll_percentage"]).to eq("20")
    end

    it "check csv headers" do
      array_headers = %w[id name tax_regime phone cnpj icms ipi pis cofins payroll_percentage]
      expect(created_company.headers).to eq(array_headers)
      expect(created_company.headers.length).to eq(10)
    end
  end
end
