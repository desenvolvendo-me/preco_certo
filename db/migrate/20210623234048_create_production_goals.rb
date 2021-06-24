# frozen_string_literal: true

class CreateProductionGoals < ActiveRecord::Migration[6.1]
  def change
    create_table :production_goals do |t|
      t.integer :monthly_goal
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
