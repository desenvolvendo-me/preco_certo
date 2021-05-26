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

  def self.productions_goals
    data_parse = DataParse.new("preco_certo/storage/production_goals.csv").parse!
    data_parse.each do |line|
      ProductionGoals.new(
        line["id"],
        line["id_product"],
        line["description"],
        line["monthly_goal"]
      )
    end
  end

  def self.create(id, id_product, description, monthly_goal)
    ProductionGoals.new(id, id_product, description, monthly_goal)
  end
end
