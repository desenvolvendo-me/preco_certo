# frozen_string_literal: true

class ProductRawMaterial < ApplicationRecord
  belongs_to :product
  belongs_to :raw_material

  after_create :calculate_raw_material_cost

  private

  def calculate_raw_material_cost
    cost = raw_material.net_price * consumption

    update(raw_material_cost: cost)
  end
end
