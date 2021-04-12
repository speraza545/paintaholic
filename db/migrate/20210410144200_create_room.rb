class CreateRoom < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.float :length
      t.float :width
      t.float :height
    end
  end
end
