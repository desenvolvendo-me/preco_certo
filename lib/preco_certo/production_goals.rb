# frozen_string_literal: true

# class Production Goals
class ProductionGoals
  attr_reader :id, :id_product, :description, :monthly_goal

  def initialize(id, id_product, description, monthly_goal)
    @id = id
    @id_product = id_product
    @description = description
    @monthly_goal = monthly_goal
  end

  def self.all
    data_parse = DataParse.new("preco_certo/storage/production_goals.csv").parse!
    data_parse.map do |line|
      ProductionGoals.new(
        line["id"],
        line["id_product"],
        line["description"],
        line["monthly_goal"]
      )
    end
  end

  def self.get_product_goal(product_id)
    product_goals = ProductionGoals.all
    product_goals.each do |product|
      return product if product.id == product_id
    end
    nil
  end

  def self.create(id, id_product, description, monthly_goal)
    ProductionGoals.new(id, id_product, description, monthly_goal)
  end
end
