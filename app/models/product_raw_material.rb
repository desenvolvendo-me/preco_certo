# frozen_string_literal: true

class ProductRawMaterial < ApplicationRecord
  belongs_to :product
  belongs_to :raw_material
end
