class CreateJobFunctions < ActiveRecord::Migration[6.1]
  def change
    create_table :job_functions do |t|
      t.string :description

      t.timestamps
    end
  end
end
