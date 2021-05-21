# frozen_string_literal: true

require "preco_certo/data_parse"

# raw_material.rb
class RawMaterial < DataParse
  def raw_materials
    parse!
  end

  def create(id, name, price, icms, ipi, pis, cofins)
    CSV.open(file, "a", options) do |csv|
      csv << []
      csv << [id, name, price, icms, ipi, pis, cofins]
    end
  end
end
