# frozen_string_literal: true

class AddNetPriceToRawMaterial < ActiveRecord::Migration[6.1]
  def change
    add_column :raw_materials, :net_price, :float
  end
end
