# frozen_string_literal: true

require_relative "preco_certo/version"
require_relative "preco_certo/company"
require_relative "preco_certo/cost"
require_relative "preco_certo/data_parse"
require_relative "preco_certo/employee"
require_relative "preco_certo/manpower"
require_relative "preco_certo/product"
require_relative "preco_certo/production_goals"
require_relative "preco_certo/products_manpower"
require_relative "preco_certo/raw_material"

# Preco Certo module Gem
module PrecoCerto
  def self.root
    File.dirname __dir__
  end

  def self.lib
    File.join(root, "lib")
  end
end
