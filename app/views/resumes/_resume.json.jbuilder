json.extract! resume, :id, :student_id, :profile_picture, :full_name, :tagline, :phone_number, :physical_address, :email_address, :work_experience, :education, :certifications, :skills, :languages, :past_projects, :workshops, :volunteerships, :relevant_links, :extra_columns, :created_at, :updated_at
json.url resume_url(resume, format: :json)
