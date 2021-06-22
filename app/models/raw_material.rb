# frozen_string_literal: true

class RawMaterial < ApplicationRecord
  has_many :product_raw_materials

  validates :name, presence: true
end
