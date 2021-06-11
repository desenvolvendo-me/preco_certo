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

  def self.fetch_raw_materials(id)
    all.find { |rm| rm.id == id }
  end

  def net_value
    total = price.to_f -
            percentage(price, icms) +
            percentage(price, ipi) -
            percentage(price, pis) -
            percentage(price, cofins)

    total.round(2)
  end

  private

  def percentage(price, tax)
    price.to_f * tax.to_f / 100
  end
end
