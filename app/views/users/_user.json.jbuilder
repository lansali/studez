json.extract! user, :id, :email, :password, :first_name, :middle_name, :last_name, :institution_name, :bio, :course_name, :year_started_course, :expected_graduation_year, :interests, :created_at, :updated_at
json.url user_url(user, format: :json)
