class CreateJob < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.string :address
      t.boolean :behr_premium
      t.integer :room_id
      t.integer :user_id
      t.date :date 
      t.time :time
    end
  end
end
