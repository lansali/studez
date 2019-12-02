module UsersHelper
    def declare_user_type
        if user_type == true
            @user.employer = true
        else
            @user.student = true
        end
    end

    def save_associatied_objects
        if user_type == true
            save_associated_employer
        else
            save_associated_student
        end
    end

    def save_associated_student
        @associated_student = Student.new(user_id: @user.id)
        @associated_student.save
    end

    def save_associated_employer
        @associated_employer = Employer.new(user_id: @user.id)
        @associated_employer.save
    end
end
