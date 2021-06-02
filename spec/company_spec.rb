# frozen_string_literal: true

RSpec.describe "Company" do
  let!(:company) { Company.new("preco_certo/storage/companies.csv") }

  before do
    company.create(6,"empresa5", "real_profit", "8655559696", "52744494000112")
  end

  let(:created_company) { company.companies[company.companies.length - 1] }

  context 'validations csv' do
    it "create a company" do
      expect(created_company["name"]).to eq("empresa5")
      expect(created_company["tax_regime"]).to eq("real_profit")
      expect(created_company["phone"]).to eq("8655559696")
      expect(created_company["cnpj"]).to eq("52744494000112")
    end
  end
end
