# frozen_string_literal: true

require "preco_certo/data_parse"

# class Product, CSV product
class Product
  attr_accessor :id, :description, :unity

  def initialize(id, description, unity)
    @id = id
    @description = description
    @unity = unity
  end

  def self.products
    data_parse = DataParse.new("preco_certo/storage/products.csv").parse!
    data_parse.map do |line|
      Product.new(
        line["id"],
        line["description"],
        line["unity"]
      )
    end
  end

  def self.calculate_manpower(id_product)
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

  def sale_price
    total_mp = ProductRawMaterial.total_cost_raw_material(id)
    total_mo = Product.calculate_manpower(id)
    rateio = Product.calculate_expense_division(id)
    indice = Markup.calculate_index("1")

    price = (total_mp + total_mo + rateio) * indice

    price.ceil(2)
  end
end
