class CreateBusinesses < ActiveRecord::Migration[6.0]
  def change
    create_table :businesses do |t|
      t.references :employer, null: false, foreign_key: true
      t.string :logo
      t.string :name
      t.text :description
      t.string :location

      t.timestamps
    end
  end
end
