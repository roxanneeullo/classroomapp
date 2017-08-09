json.extract! student, :id, :user_id, :course_id, :year_level, :created_at, :updated_at
json.url student_url(student, format: :json)
