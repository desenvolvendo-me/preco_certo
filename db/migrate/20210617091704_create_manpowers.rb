class CreateManpowers < ActiveRecord::Migration[6.1]
  def change
    create_table :manpowers do |t|
      t.string :description
      t.float :time_hex

      t.timestamps
    end
  end
end
