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

  def net_value(company_id = nil)
    if company_id
      company = Company.all
      total = calc_net_value(company)
    else
      total = calc_net_value(self)
    end
    total.round(2)
  end

  private

  def calc_net_value(subject)
    price -
      price * subject.icms.to_f / 100 +
      price * subject.ipi.to_f / 100 -
      price * subject.pis.to_f / 100 -
      price * subject.cofins.to_f / 100
  end
end
