class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.references :user, null: false, foreign_key: true
      t.string :institution_name
      t.text :bio
      t.string :course_name
      t.date :year_started_course
      t.date :expected_graduation_year
      t.text :interests

      t.timestamps
    end
  end
end
