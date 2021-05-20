# frozen_string_literal: true

require "preco_certo/data_parse"

# company.rb
class Company < DataParse
  def companies
    parse!
  end

  def create(id, name, tax_regime, phone, cnpj)
    CSV.open(file, "a", options) do |csv|
      csv << []
      csv << [id, name, tax_regime, phone, cnpj]
    end
  end
end
