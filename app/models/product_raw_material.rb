# frozen_string_literal: true

# == Schema Information
#
# Table name: product_raw_materials
#
#  id                :bigint(8)        not null, primary key
#  consumption       :float
#  raw_material_cost :float
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  product_id        :bigint(8)        not null
#  raw_material_id   :bigint(8)        not null
#
# Indexes
#
#  index_product_raw_materials_on_product_id       (product_id)
#  index_product_raw_materials_on_raw_material_id  (raw_material_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#  fk_rails_...  (raw_material_id => raw_materials.id)
#


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
