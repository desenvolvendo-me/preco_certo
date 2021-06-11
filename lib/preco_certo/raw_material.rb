# frozen_string_literal: true

require "preco_certo/data_parse"

# raw_material.rb
class RawMaterial
  attr_reader :id, :name, :price, :icms, :ipi, :pis, :cofins

  def initialize(id, name, price, icms, ipi, pis, cofins)
    @id = id.to_i
    @name = name
    @price = price.to_f
    @icms = icms.to_f
    @ipi = ipi.to_f
    @pis = pis.to_f
    @cofins = cofins.to_f
  end

  def self.all
    file = "preco_certo/storage/raw_materials.csv"
    data_parse = DataParse.new(file).parse!
    data_parse.map do |line|
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

  def self.fetch_raw_materials(id)
    all.find { |rm| rm.id == id }
  end

  def net_value
    total = price -
            price * icms / 100 +
            price * ipi / 100 -
            price * pis / 100 -
            price * cofins / 100

    total.round(2)
  end
end
