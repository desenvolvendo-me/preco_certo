# frozen_string_literal: true

require "preco_certo/data_parse"

# class ProductManPower, CSV products_manpower
class ProductManPower
  attr_accessor :id_product, :operation, :employee, :salary, :time, :cost_mo

  def initialize(id_product, operation, employee, salary, time, cost_mo)
    @id_product = id_product
    @operation = operation
    @employee = employee
    @salary = salary
    @time = time
    @cost_mo = cost_mo
  end

  def self.productsmanpower
    data_parse = DataParse.new("preco_certo/storage/products_manpower.csv").parse!
    data_parse.each do |line|
      ProductManPower.new(
        line["id_product"],
        line["operation"],
        line["employee"],
        line["salary"],
        line["time"],
        line["cost_mo"]
      )
    end
  end

  def self.create(id_product, operation, employee, salary, time, cost_mo)
    ProductManPower.new(id_product, operation, employee, salary, time, cost_mo)
  end
end
