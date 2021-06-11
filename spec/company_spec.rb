# frozen_string_literal: true

RSpec.describe "Company" do
  before do
    Company.create(6, "empresa5", "real_profit", "8655559696", "52744494000112", 1.2, 3, 4, 2, 20)
  end

  let(:created_company) { Company.all[-1] }

  context "validations csv" do
    it "create a company" do
      expect(created_company.name).to eq("empresa5")
      expect(created_company.tax_regime).to eq("real_profit")
      expect(created_company.phone).to eq("8655559696")
      expect(created_company.cnpj).to eq("52744494000112")
      expect(created_company.icms).to eq("1.2")
      expect(created_company.ipi).to eq("3")
      expect(created_company.pis).to eq("4")
      expect(created_company.cofins).to eq("2")
      expect(created_company.payroll_percentage).to eq("20")
    end

    it "check csv headers" do
      headers = CSV.open("lib/preco_certo/storage/companies.csv", col_sep: ";", &:readline)

      expect(headers.length).to eq(10)
      expect(headers).to eq(%w[id name tax_regime phone cnpj icms ipi pis cofins payroll_percentage])
    end
  end
end
