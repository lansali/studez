class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :username
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.boolean :admin
      t.boolean :moderator
      t.boolean :employer
      t.boolean :student

      t.timestamps
    end
    add_index :users, [:email, :username], unique: true
  end
end
