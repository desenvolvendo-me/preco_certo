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

  def self.calculate_net_value(id_raw_material)
    raw_material = raw_materials.select do |rm|
      rm["id"] = id_raw_material
    end.first

    total = raw_material["price"].to_f -
            raw_material["icms"].to_f +
            raw_material["ipi"].to_f -
            raw_material["pis"].to_f -
            raw_material["cofins"].to_f

    total.ceil(2)
  end
end
