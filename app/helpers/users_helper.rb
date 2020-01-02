module UsersHelper
    def declare_user_type(user_params)
        settings = {}
        bool_flag = user_type == true
        settings[:privacy] =  bool_flag ? 'y' : 'n'
        settings[:account_type] = bool_flag ? 'business' : 'student'
        user_params.merge({ "settings": settings })
    end

    def save_associatied_objects
        user_type == true ? save_associated_business : save_associated_student
    end

    def save_associated_student
        @associated_student = Student.new(user_id: @user.id)
        @associated_student.save!
    end

    def save_associated_business
        @associated_business = Employer.new(user_id: @user.id)
        @associated_business.save!
    end
end
