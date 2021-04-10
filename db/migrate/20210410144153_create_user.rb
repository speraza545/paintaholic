class CreateUser < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name 
      t.string :email
      t.string :phone_number
      t.string :address
      t.string :password_digest
    end
  end
end
