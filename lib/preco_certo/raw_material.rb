# frozen_string_literal: true

require "preco_certo/data_parse"

# raw_material.rb
class RawMaterial < DataParse
  def raw_materials
    parse!
  end

  def create(attributes)
    CSV.open(file, "a", options) do |csv|
      csv << attributes
    end
  end
end
