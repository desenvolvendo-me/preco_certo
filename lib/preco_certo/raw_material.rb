# frozen_string_literal: true

require "preco_certo/data_parse"

# raw_material.rb
class RawMaterial
  def initialize(id, name, price, icms, ipi, pis, cofins)
    @id = id
    @name = name
    @price = price
    @icms = icms
    @ipi = ipi
    @pis = pis
    @cofins = cofins
  end

  def self.raw_materials
    file = "preco_certo/storage/raw_materials.csv"
    data_parse = DataParse.new(file).parse!
    data_parse.each do |line|
      RawMaterial.new(
        line["id"],
        line["name"],
        line["price"],
        line["icms"],
        line["ipi"],
        line["pis"],
        line["cofins"]
      )
    end
  end

  def self.create(attributes)
    file = "preco_certo/storage/raw_materials.csv"

    DataParse.new(file).create(attributes)
  end

  def self.calculate_net_value(id, id_company)
    # TODO: revisar estes calculos, provavelmente estao errados
    raw_material = fetch_raw_materials(id)
    total = 0

    if id_company.zero?
      total = raw_material["price"].to_f -
              raw_material["icms"].to_f +
              raw_material["ipi"].to_f -
              raw_material["pis"].to_f -
              raw_material["cofins"].to_f
    else
      data_parse = DataParse.new("preco_certo/storage/companies.csv").parse!
      data_parse.each do |line|
        next unless line["id"].to_i == id_company

        total = raw_material["price"].to_f -
                line["icms"].to_f +
                line["ipi"].to_f +
                line["pis"].to_f +
                line["cofins"].to_f
      end
    end
    total.ceil(2)
  end

  def self.fetch_raw_materials(id)
    raw_materials.select { |rm| rm["id"] = id }.first
  end
end
