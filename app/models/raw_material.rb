# frozen_string_literal: true

# == Schema Information
#
# Table name: raw_materials
#
#  id         :bigint(8)        not null, primary key
#  cofins     :float
#  icms       :float
#  ipi        :float
#  name       :string
#  net_price  :float
#  pis        :float
#  price      :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


class RawMaterial < ApplicationRecord
  has_many :product_raw_materials

  validates :name, :net_price, presence: true
end
