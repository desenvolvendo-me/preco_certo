# frozen_string_literal: true

class CreateRawMaterials < ActiveRecord::Migration[6.1]
  def change
    create_table :raw_materials do |t|
      t.string :name
      t.float :price
      t.float :icms
      t.float :ipi
      t.float :pis
      t.float :cofins

      t.timestamps
    end
  end
end
