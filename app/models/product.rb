# frozen_string_literal: true

class Product < ApplicationRecord
  validates :description, :unity, presence: true
end
