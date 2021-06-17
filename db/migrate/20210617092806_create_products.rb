# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :description
      t.string :unity

      t.timestamps
    end
  end
end
