# frozen_string_literal: true

class RawMaterial < ApplicationRecord
  has_many :product_raw_materials

  validates :name, :net_price, presence: true
end
