module UsersHelper
    def declare_user_type
        if user_type == true
            @user.settings['account_type'] = 'business'
        else
            @user.settings['account_type'] = 'student'
        end
    end

    def save_associatied_objects
        if user_type == true
            save_associated_business
        else
            save_associated_student
        end
    end

    def save_associated_student
        @associated_student = Student.new(user_id: @user.id)
        @associated_student.save
    end

    def save_associated_business
        @associated_business = Employer.new(user_id: @user.id)
        @associated_business.save
    end
end
