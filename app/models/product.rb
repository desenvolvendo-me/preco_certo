# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :company
  has_many :product_raw_materials

  validates :description, :unity, presence: true
end
