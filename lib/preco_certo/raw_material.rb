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
        line["cofins"],
      )
    end
  end

  def self.create(attributes)
    file = "preco_certo/storage/raw_materials.csv"

    DataParse.new(file).create(attributes)
  end
end
