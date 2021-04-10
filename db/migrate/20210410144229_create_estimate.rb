class CreateEstimate < ActiveRecord::Migration[5.2]
  def change
    create_table :estimates do |t|
      t.float :labor_hours
      t.float :rate
      t.float :material_cost
      t.integer :job_id
    end
  end
end
