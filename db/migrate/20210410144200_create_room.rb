class CreateRoom < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.float :length
      t.float :width
      t.float :height
      t.integer :user_id
      t.integer :job_id
    end
  end
end
