# frozen_string_literal: true

require "preco_certo/data_parse"

# class Product, CSV product
class Product
  attr_accessor :id_product, :description, :unity

  def initialize(id_product, description, unity)
    @id_product = id_product
    @description = description
    @unity = unity
  end

  def self.products
    data_parse = DataParse.new("preco_certo/storage/products.csv").parse!
    data_parse.each do |line|
      Product.new(
        line["id_product"],
        line["description"],
        line["unity"]
      )
    end
  end

  def self.calculemanpower(id_product)
    data_parse = DataParse.new("preco_certo/storage/products_manpower.csv").parse!
    total_manpower = 0.00
    # verificar melhor maneira de filtrar o array
    data_parse.each do |line|
      total_manpower += line["cost_mo"].to_f if line["id_product"] == id_product
    end
    total_manpower
  end

  def self.calculate_expense_division(product_id)
    product_goal = ProductionGoals.get_product_goal(product_id)
    total_expense = Expense.calculate_total
    total_expense.to_f / product_goal["monthly_goal"].to_i
  end

  def self.create(id_product, description, unity)
    Product.new(id_product, description, unity)
  end
end
