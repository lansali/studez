class CreateSubmissions < ActiveRecord::Migration[6.0]
  def change
    create_table :submissions do |t|
      t.references :opportunity, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true
      t.string :cover_letter
      t.string :cv

      t.timestamps
    end
  end
end
