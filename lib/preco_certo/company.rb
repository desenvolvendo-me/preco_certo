# frozen_string_literal: true

require "preco_certo/data_parse"

class Company < DataParse

  def companies
    parse!
  end

  def create(name, tax_regime, phone, cnpj)
    all_companies = companies
    id = companies[companies.length - 1]["id"].to_i + 1
    all_companies << [id, name, tax_regime, phone, cnpj]

    CSV.open(file, "wb", options) do |csv|
      csv << all_companies.headers
      all_companies.each do |company|
        csv << company
      end
    end
  end
end
