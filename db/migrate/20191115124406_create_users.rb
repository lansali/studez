class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :institution_name
      t.text :bio
      t.string :course_name
      t.decimal :year_started_course
      t.decimal :expected_graduation_year
      t.text :interests

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
