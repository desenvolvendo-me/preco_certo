# frozen_string_literal: true

require "preco_certo/data_parse"

# raw_material.rb
class RawMaterial
  attr_reader :id, :name, :price, :icms, :ipi, :pis, :cofins

  def initialize(id, name, price, icms, ipi, pis, cofins)
    @id = id
    @name = name
    @price = price
    @icms = icms
    @ipi = ipi
    @pis = pis
    @cofins = cofins
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

  def self.calculate_net_value(id)
    raw_material = fetch_raw_materials(id)

    price = raw_material.price.to_f

    total = price -
            percentage(price, raw_material.icms.to_f) +
            percentage(price, raw_material.ipi.to_f) -
            percentage(price, raw_material.pis.to_f) -
            percentage(price, raw_material.cofins.to_f)

    total.round(2)
  end

  def self.percentage(price, tax)
    price * tax / 100
  end

  def self.fetch_raw_materials(id)
    all.find { |rm| rm.id == id }
  end
end
