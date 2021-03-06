# frozen_string_literal: true

require "preco_certo/data_parse"

# class ProductManPower, CSV products_manpower
class ProductManPower
  attr_accessor :id_product, :operation, :employee, :salary, :time, :cost_mo, :type_operation, :id_equipment

  def initialize(id_product, operation, employee, salary, time, cost_mo, type_operation, id_equipment)
    @id_product = id_product
    @operation = operation
    @employee = employee
    @salary = salary
    @time = time
    @cost_mo = cost_mo
    @type_operation = type_operation
    @id_equipment = id_equipment
  end

  def self.all
    data_parse = DataParse.new("preco_certo/storage/products_manpower.csv").parse!
    data_parse.map do |line|
      ProductManPower.new(
        line["id_product"],
        line["operation"],
        line["employee"],
        line["salary"],
        line["time"],
        line["cost_mo"],
        line["type_operation"],
        line["id_equipment"]
      )
    end
  end

  def self.create(id_product, operation, employee, salary, time, cost_mo, type_operation, id_equipment)
    ProductManPower.new(id_product, operation, employee, salary, time, cost_mo, type_operation, id_equipment)
  end

  def self.machine_time(product_id = nil)
    ProductManPower.calculate_work_time("machine", product_id)
  end

  def self.manual_time(product_id = nil)
    ProductManPower.calculate_work_time("manual", product_id)
  end

  def self.calculate_work_time(work_type, product_id = nil)
    work_types = {
      "manual" => "0",
      "machine" => "1"
    }

    products_manpower = product_id ? all.select { |prod| prod.id_product == product_id } : all

    return 0 if products_manpower.empty?

    products_manpower.reduce(0) do |time, product|
      product.type_operation == work_types[work_type] ? time + product.time.to_f : time
    end
  end
end
