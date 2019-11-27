json.extract! student, :id, :user_id, :institution_name, :bio, :course_name, :year_started_course, :expected_graduation_year, :interests, :created_at, :updated_at
json.url student_url(student, format: :json)
