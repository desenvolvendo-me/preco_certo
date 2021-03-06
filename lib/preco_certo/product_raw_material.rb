# frozen_string_literal: true

require "preco_certo/data_parse"

# class ProductRawMaterial, CSV product_materials.csv
class ProductRawMaterial
  attr_accessor :product_id, :raw_material_description, :net_price, :consumption, :raw_material_cost, :id

  def initialize(id, product_id, raw_material_description, net_price, consumption, raw_material_cost)
    @product_id = product_id
    @raw_material_description = raw_material_description
    @net_price = net_price
    @consumption = consumption
    @raw_material_cost = raw_material_cost
    @id = id
  end

  def self.all
    data_parse = DataParse.new("preco_certo/storage/product_materials.csv").parse!
    data_parse.map do |line|
      ProductRawMaterial.new(
        line["id"],
        line["product_id"],
        line["raw_material_description"],
        line["net_price"],
        line["consumption"],
        line["raw_material_cost"]
      )
    end
  end

  def self.total_cost_raw_material(product_id)
    data_parse = DataParse.new("preco_certo/storage/product_materials.csv").parse!
    total_cost = 0
    data_parse.each do |line|
      total_cost += line["raw_material_cost"].to_f if line["product_id"] == product_id
    end
    total_cost
  end

  def self.create(id, product_id, raw_material_description, net_price, consumption, raw_material_cost)
    ProductRawMaterial.new(id, product_id, raw_material_description, net_price, consumption, raw_material_cost)
  end
end
