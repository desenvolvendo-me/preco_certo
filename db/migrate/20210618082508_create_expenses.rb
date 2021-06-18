class CreateExpenses < ActiveRecord::Migration[6.1]
  def change
    create_table :expenses do |t|
      t.string :description
      t.float :value
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
