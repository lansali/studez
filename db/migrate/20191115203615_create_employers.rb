class CreateEmployers < ActiveRecord::Migration[6.0]
  def change
    create_table :employers do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :bio

      t.timestamps
    end
  end
end
