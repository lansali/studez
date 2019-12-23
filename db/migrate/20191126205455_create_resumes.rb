class CreateResumes < ActiveRecord::Migration[6.0]
  def change
    create_table :resumes do |t|
      t.references :student, null: false, foreign_key: true
      t.string :profile_picture
      t.string :full_name
      t.string :tagline
      t.string :phone_number
      t.string :physical_address
      t.string :email_adress
      t.string :work_experience
      t.string :education
      t.string :certifications
      t.string :skills
      t.string :languages
      t.string :past_projects
      t.string :workshops
      t.string :volunteerships
      t.string :relevant_links
      t.string :extra_columns

      t.timestamps
    end
  end
end
