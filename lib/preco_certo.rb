# frozen_string_literal: true

require_relative "preco_certo/version"
require_relative "preco_certo/data_parse"
require_relative "preco_certo/employee"
require_relative "preco_certo/helpers"
require_relative "preco_certo/job_function"
require_relative "preco_certo/production_goals"
require_relative "preco_certo/products_manpower"
require_relative "preco_certo/markup"
require_relative "preco_certo/equipment"

# Preco Certo module Gem
module PrecoCerto
  def self.root
    File.dirname __dir__
  end

  def self.lib
    File.join(root, "lib")
  end
end
