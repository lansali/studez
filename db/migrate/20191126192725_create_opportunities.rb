class CreateOpportunities < ActiveRecord::Migration[6.0]
  def change
    create_table :opportunities do |t|
      t.string :name
      t.references :business, null: false, foreign_key: true
      t.text :description
      t.text :requirements
      t.text :other
      t.date :deadline
      t.string :category

      t.timestamps
    end
  end
end
