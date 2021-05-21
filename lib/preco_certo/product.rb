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

    def self.create(id_product, description, unity)
      Product.new(id_product, description, unity)
    end
end