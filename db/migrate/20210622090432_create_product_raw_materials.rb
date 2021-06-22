# frozen_string_literal: true

class CreateProductRawMaterials < ActiveRecord::Migration[6.1]
  def change
    create_table :product_raw_materials do |t|
      t.float :consumption
      t.float :raw_material_cost
      t.references :product, null: false, foreign_key: true
      t.references :raw_material, null: false, foreign_key: true

      t.timestamps
    end
  end
end
