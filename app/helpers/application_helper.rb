module ApplicationHelper
    def is_current_path?(test_path)
        request.path == test_path
    end

    def set_next_url
        @next_url = request.path
    end

    def current_class?(test_path)
        return ' border-b-2 border-green-500 hover:border-green-700' if is_current_path?(test_path)
        ''
    end

    def lacks_resume?(student_id)
        Resume.where(student_id: student_id).first.nil?
    end
end
