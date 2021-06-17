class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :tax_regime
      t.string :phone
      t.string :cnpj
      t.float :icms
      t.float :ipi
      t.float :pis
      t.float :cofins
      t.float :payroll_percentage

      t.timestamps
    end
  end
end
