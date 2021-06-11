# frozen_string_literal: true

# company.rb
class Company
  attr_reader :id, :name, :tax_regime, :phone, :cnpj, :icms, :ipi, :pis, :cofins, :payroll_percentage

  def initialize(id, name, tax_regime, phone, cnpj, icms, ipi, pis, cofins, payroll_percentage)
    @id = id
    @name = name
    @tax_regime = tax_regime
    @phone = phone
    @cnpj = cnpj
    @icms = icms
    @ipi = ipi
    @pis = pis
    @cofins = cofins
    @payroll_percentage = payroll_percentage
  end

  def self.all
    data_parse = DataParse.new("preco_certo/storage/companies.csv").parse!

    data_parse.map do |company|
      Company.new(
        company["id"],
        company["name"],
        company["tax_regime"],
        company["phone"],
        company["cnpj"],
        company["icms"],
        company["ipi"],
        company["pis"],
        company["cofins"],
        company["payroll_percentage"]
      )
    end
  end

  def self.create(id, name, tax_regime, phone, cnpj, icms, ipi, pis, cofins, payroll_percentage)
    CSV.open("lib/preco_certo/storage/companies.csv", "a", col_sep: ";", headers: true) do |csv|
      csv << [id, name, tax_regime, phone, cnpj, icms, ipi, pis, cofins, payroll_percentage]
    end

    Company.new(id, name, tax_regime, phone, cnpj, icms, ipi, pis, cofins, payroll_percentage)
  end
end
